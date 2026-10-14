//
//  CourseDateListView.swift
//  Course
//
//  Created by Ivan Stepanok on 09.12.2024.
//

import SwiftUI
import Core
import Theme

struct CourseDateListView: View {
    @ObservedObject var viewModel: CourseDatesViewModel
    @State private var isExpanded = false
    @Binding var coordinate: CGFloat
    @Binding var collapsed: Bool
    @Binding var viewHeight: CGFloat
    var courseDates: CourseDates?
    let courseID: String

    var body: some View {
        GeometryReader { proxy in
            VStack {
                ScrollView {
                    DynamicOffsetView(
                        coordinate: $coordinate,
                        collapsed: $collapsed,
                        viewHeight: $viewHeight
                    )
                    VStack(alignment: .leading, spacing: 0) {

                        @State var status: SyncStatus = .offline

                        // Calendar sync and the dates banner only apply to course dates; sessions
                        // alone don't need them.
                        if let courseDates, !courseDates.courseDateBlocks.isEmpty {
                            CalendarSyncStatusView(status: status, router: viewModel.router)
                                .padding(.bottom, 16)
                                .task {
                                    status = await viewModel.syncStatus()
                                }

                            if !courseDates.hasEnded {
                                DatesStatusInfoView(
                                    datesBannerInfo: courseDates.datesBannerInfo,
                                    courseID: courseID,
                                    courseDatesViewModel: viewModel,
                                    screen: .courseDates
                                )
                                .padding(.bottom, 16)
                            }
                        }

                        ForEach(viewModel.sections()) { section in
                            let status = section.status
                            if status == .completed {
                                CompletedBlocks(
                                    isExpanded: $isExpanded,
                                    courseDateBlockDict: section.dates,
                                    viewModel: viewModel
                                )
                            } else {
                                Text(status.localized)
                                    .font(Theme.Fonts.titleSmall)
                                    .padding(.top, 10)
                                    .padding(.bottom, 10)
                                HStack {
                                    TimeLineView(status: status)
                                        .padding(.bottom, 15)
                                    VStack(alignment: .leading) {
                                        ForEach(
                                            DatesEntry.entries(dates: section.dates, sessions: section.sessions)
                                        ) { entry in
                                            switch entry {
                                            case let .dates(date, blocks):
                                                let block = blocks[0]
                                                dateHeader(
                                                    DatesHeader.text(
                                                        for: date,
                                                        formattedDate: block.formattedDate,
                                                        status: status,
                                                        useRelativeDates: block.useRelativeDates
                                                    )
                                                )
                                                BlockStatusView(
                                                    viewModel: viewModel,
                                                    block: block,
                                                    blocks: blocks
                                                )
                                            case let .session(session):
                                                dateHeader(
                                                    DatesHeader.text(
                                                        for: session.localDate(),
                                                        formattedDate: session.formattedDate,
                                                        status: status,
                                                        useRelativeDates: session.useRelativeDates
                                                    )
                                                )
                                                CourseSessionView(session: session)
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 5)
                    .frameLimit(width: proxy.size.width)
                    Spacer(minLength: 200)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
    }

    /// The date above a group of rows, or nothing when `DatesHeader.text` returns nil.
    @ViewBuilder
    private func dateHeader(_ text: String?) -> some View {
        if let text {
            Text(text)
                .font(Theme.Fonts.labelMedium)
                .foregroundStyle(Theme.Colors.textPrimary)
        }
    }
}

/// The header text above a group of rows on the Dates screen.
enum DatesHeader {
    /// With relative dates on:
    /// - "Today" section: no header, since it would only repeat the section title. Session
    ///   cards still show their date, including the range of a session that started earlier.
    /// - "This week" and "Next week": "Tomorrow" or the weekday name ("Monday") for every day,
    ///   instead of switching to "Next Tuesday" or a date after 7 days; the section title
    ///   already says which week it is.
    /// Otherwise `formattedDate`, the app's usual date text.
    static func text(
        for date: Date?,
        formattedDate: String,
        status: CompletionStatus,
        useRelativeDates: Bool,
        now: Date = Date(),
        calendar: Calendar = .current,
        locale: Locale = .autoupdatingCurrent
    ) -> String? {
        guard useRelativeDates else { return formattedDate }
        switch status {
        case .today:
            return nil
        case .thisWeek, .nextWeek:
            guard let date else { return formattedDate }
            let tomorrow = calendar.date(byAdding: .day, value: 1, to: calendar.startOfDay(for: now))
            if let tomorrow, calendar.isDate(date, inSameDayAs: tomorrow) {
                return CoreLocalization.tomorrow
            }
            let formatter = DateFormatter()
            formatter.calendar = calendar
            formatter.timeZone = calendar.timeZone
            formatter.locale = locale
            formatter.setLocalizedDateFormatFromTemplate("EEEE")
            return formatter.string(from: date)
        default:
            return formattedDate
        }
    }
}

/// One row group in a Dates section: the course dates that share a date, or a session.
enum DatesEntry: Identifiable {
    case dates(Date, [CourseDateBlock])
    case session(CourseSessionBlock)

    var id: String {
        switch self {
        case let .dates(date, _): return "dates-\(date.timeIntervalSince1970)"
        case let .session(session): return "session-\(session.id)"
        }
    }

    var sortDate: Date {
        switch self {
        case let .dates(date, _): return date
        case let .session(session): return session.localDate() ?? .distantFuture
        }
    }

    /// Course dates and sessions of one section in date order. Ties keep course dates first
    /// and sessions in the order the API returned them.
    static func entries(dates: [Date: [CourseDateBlock]], sessions: [CourseSessionBlock]) -> [DatesEntry] {
        let all = dates.keys.sorted().map { DatesEntry.dates($0, dates[$0] ?? []) }
            + sessions.map { DatesEntry.session($0) }
        return all.enumerated()
            .map { (entry: $0.element, date: $0.element.sortDate, offset: $0.offset) }
            .sorted { ($0.date, $0.offset) < ($1.date, $1.offset) }
            .map(\.entry)
    }
}
