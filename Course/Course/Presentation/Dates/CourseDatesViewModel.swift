//
//  CourseDatesViewModel.swift
//  Course
//
//  Created by Muhammad Umer on 10/18/23.
//

import Foundation
import Core
import SwiftUI
import OEXFoundation

@MainActor
public class CourseDatesViewModel: ObservableObject {
    
    enum EventState: Sendable {
        case addedCalendar
        case removedCalendar
        case updatedCalendar
        case shiftedDueDates
        case none
    }
    
    @Published var isShowProgress = true
    @Published var showError: Bool = false
    @Published var courseDates: CourseDates?
    @Published var courseSessions: [CourseSessionBlock] = []
    /// True while the first schedule request is in flight, so a course with only sessions
    /// keeps its spinner instead of flashing the "no dates" state.
    @Published private(set) var isLoadingSessions = false
    @Published var isOn: Bool = false
    @Published var eventState: EventState?

    var errorMessage: String? {
        didSet {
            withAnimation {
                showError = errorMessage != nil
            }
        }
    }
    
    private let interactor: CourseInteractorProtocol
    let cssInjector: CSSInjector
    let router: CourseRouter
    let connectivity: ConnectivityProtocol
    let config: ConfigProtocol
    let courseID: String
    let courseName: String
    var courseStructure: CourseStructure?
    let analytics: CourseAnalytics
    let calendarManager: CalendarManagerProtocol
    private var sessionsRequestID = 0

    public init(
        interactor: CourseInteractorProtocol,
        router: CourseRouter,
        cssInjector: CSSInjector,
        connectivity: ConnectivityProtocol,
        config: ConfigProtocol,
        courseID: String,
        courseName: String,
        analytics: CourseAnalytics,
        calendarManager: CalendarManagerProtocol
    ) {
        self.interactor = interactor
        self.router = router
        self.cssInjector = cssInjector
        self.connectivity = connectivity
        self.config = config
        self.courseID = courseID
        self.courseName = courseName
        self.analytics = analytics
        self.calendarManager = calendarManager
        addObservers()
    }
        
    /// One heading on the Dates screen with its course dates and sessions.
    struct DatesSection: Identifiable {
        let status: CompletionStatus
        let dates: [Date: [CourseDateBlock]]
        let sessions: [CourseSessionBlock]

        var id: CompletionStatus { status }
    }

    /// The non-empty sections in display order. Course dates and sessions are grouped
    /// together against the same `now`, once per call, so they always agree on the day
    /// and week. Sessions are informational: never `.completed`, and past ones go under `.past`.
    func sections(now: Date = Date()) -> [DatesSection] {
        let desiredSequence: [CompletionStatus] = [
            .completed, .pastDue, .past, .today, .thisWeek, .nextWeek, .upcoming
        ]
        let datesByStatus = courseDates?.statusDatesBlocks(now: now) ?? [:]
        let sessionsByStatus = Self.groupByStatus(courseSessions, now: now)
        return desiredSequence.compactMap { status in
            let dates = datesByStatus[status] ?? [:]
            let sessions = sessionsByStatus[status] ?? []
            guard !dates.isEmpty || !sessions.isEmpty else { return nil }
            return DatesSection(status: status, dates: dates, sessions: sessions)
        }
    }

    var sortedStatuses: [CompletionStatus] {
        sections().map(\.status)
    }

    var sessionsByStatus: [CompletionStatus: [CourseSessionBlock]] {
        Self.groupByStatus(courseSessions, now: Date())
    }

    private static func groupByStatus(
        _ sessions: [CourseSessionBlock],
        now: Date
    ) -> [CompletionStatus: [CourseSessionBlock]] {
        Dictionary(grouping: sessions) { $0.status(today: now) }
    }

    var hasDatesContent: Bool {
        !(courseDates?.courseDateBlocks.isEmpty ?? true) || !courseSessions.isEmpty
    }

    /// Loads the section schedule. It is optional: any failure (not enrolled, plugin not
    /// installed, server or network error) means no new sessions, and it never touches
    /// the dates, the progress indicator or the error message. A failed refresh keeps the
    /// sessions already shown, and only the most recent request may update them.
    @MainActor
    func getCourseSessions(courseID: String) async {
        sessionsRequestID += 1
        let requestID = sessionsRequestID
        isLoadingSessions = courseSessions.isEmpty
        defer {
            if requestID == sessionsRequestID {
                isLoadingSessions = false
            }
        }
        do {
            let sessions = try await interactor.getCourseSchedule(courseID: courseID)
            guard requestID == sessionsRequestID else { return }
            courseSessions = sessions
        } catch {
            debugLog("Course schedule unavailable: \(error.localizedDescription)")
        }
    }

    @MainActor
    func getCourseDates(courseID: String) async {
        isShowProgress = true
        do {
            courseDates = try await interactor.getCourseDates(courseID: courseID)
            await getCourseStructure(courseID: courseID)
            if courseDates?.courseDateBlocks == nil {
                isShowProgress = false
                courseDates = nil
                return
            }
            isShowProgress = false
        } catch {
            isShowProgress = false
            courseDates = nil
        }
    }
    
    func showCourseDetails(componentID: String, blockLink: String) async {
        do {
            let courseStructure = try await interactor.getLoadedCourseBlocks(courseID: courseID)
            router.showCourseComponent(
                componentID: componentID,
                courseStructure: courseStructure,
                blockLink: blockLink
            )
        } catch _ {
            errorMessage = CourseLocalization.Error.componentNotFount
        }
    }
    
    @MainActor
    func getCourseStructure(courseID: String) async {
        do {
            courseStructure = try await interactor.getLoadedCourseBlocks(courseID: courseID)
        } catch _ {
            errorMessage = CourseLocalization.Error.componentNotFount
        }
    }
    
    func syncStatus() async -> SyncStatus {
       return await calendarManager.courseStatus(courseID: courseID)
    }
    
    @MainActor
    func shiftDueDates(courseID: String, withProgress: Bool = true, screen: DatesStatusInfoScreen, type: String) async {
        isShowProgress = withProgress
        do {
            try await interactor.shiftDueDates(courseID: courseID)
            NotificationCenter.default.post(name: .shiftCourseDates, object: (courseID, courseName))
            isShowProgress = false
            trackPLSuccessEvent(
                .plsShiftDatesSuccess,
                bivalue: .plsShiftDatesSuccess,
                courseID: courseID,
                screenName: screen.rawValue,
                type: type,
                success: true
            )
        } catch let error {
            trackPLSuccessEvent(
                .plsShiftDatesSuccess,
                bivalue: .plsShiftDatesSuccess,
                courseID: courseID,
                screenName: screen.rawValue,
                type: type,
                success: false
            )
            isShowProgress = false
            if error.isInternetError || error is NoCachedDataError {
                errorMessage = CoreLocalization.Error.slowOrNoInternetConnection
            } else {
                errorMessage = CoreLocalization.Error.unknownError
            }
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

extension CourseDatesViewModel {
    private func addObservers() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(handleShiftDueDates),
            name: .shiftCourseDates, object: nil
        )
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(getCourseDates),
            name: .getCourseDates, object: nil
        )

        // Sections depend on today's date, so redraw when the day changes (midnight, or a
        // time zone or clock change) while the screen is open.
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(handleDayChanged),
            name: .NSCalendarDayChanged, object: nil
        )
    }

    @objc private func handleDayChanged(_ notification: Notification) {
        Task { @MainActor [weak self] in
            self?.objectWillChange.send()
        }
    }
    
    /// The course a dates notification is for. `.shiftCourseDates` is posted with the course
    /// ID alone from the course container and with `(courseID, courseName)` from this screen.
    private func notificationCourseID(_ notification: Notification) -> String? {
        if let courseID = notification.object as? String {
            return courseID
        }
        if let (courseID, _) = notification.object as? (String, String) {
            return courseID
        }
        return nil
    }

    @objc private func getCourseDates(_ notification: Notification) {
        if let notifiedID = notificationCourseID(notification), notifiedID != courseID {
            return
        }
        Task {
            await getCourseDates(courseID: courseID)
        }
        Task {
            await getCourseSessions(courseID: courseID)
        }
    }

    @objc private func handleShiftDueDates(_ notification: Notification) {
        guard let courseID = notificationCourseID(notification), courseID == self.courseID else { return }
        Task {
            await getCourseSessions(courseID: courseID)
        }
        Task {
            await getCourseDates(courseID: courseID)
            await MainActor.run { [weak self] in
                self?.eventState = .shiftedDueDates
            }
        }
    }
    
    func resetEventState() {
        eventState = EventState.none
    }
}

extension CourseDatesViewModel {
    
    func logdateComponentTapped(block: CourseDateBlock, supported: Bool) {
        analytics.datesComponentTapped(
            courseId: courseID,
            blockId: block.firstComponentBlockID,
            link: block.link,
            supported: supported
        )
    }
    
    func trackPLSEvent(
        _ event: AnalyticsEvent,
        bivalue: EventBIValue,
        courseID: String,
        screenName: String,
        type: String
    ) {
        analytics.plsEvent(
            event,
            bivalue: bivalue,
            courseID: courseID,
            screenName: screenName,
            type: type
        )
    }
    
    private func trackPLSuccessEvent(
        _ event: AnalyticsEvent,
        bivalue: EventBIValue,
        courseID: String,
        screenName: String,
        type: String,
        success: Bool
    ) {
        analytics.plsSuccessEvent(
            event,
            bivalue: bivalue,
            courseID: courseID,
            screenName: screenName,
            type: type,
            success: success
        )
    }
}
