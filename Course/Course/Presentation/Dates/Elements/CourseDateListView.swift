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

                        ForEach(Array(viewModel.sortedStatuses), id: \.self) { status in
                            let courseDateBlockDict = courseDates?.statusDatesBlocks[status] ?? [:]
                            if status == .completed {
                                CompletedBlocks(
                                    isExpanded: $isExpanded,
                                    courseDateBlockDict: courseDateBlockDict,
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
                                            DatesEntry.entries(
                                                dates: courseDateBlockDict,
                                                sessions: viewModel.sessionsByStatus[status] ?? []
                                            )
                                        ) { entry in
                                            switch entry {
                                            case let .dates(_, blocks):
                                                let block = blocks[0]
                                                Text(block.formattedDate)
                                                    .font(Theme.Fonts.labelMedium)
                                                    .foregroundStyle(Theme.Colors.textPrimary)
                                                BlockStatusView(
                                                    viewModel: viewModel,
                                                    block: block,
                                                    blocks: blocks
                                                )
                                            case let .session(session):
                                                Text(session.formattedDate)
                                                    .font(Theme.Fonts.labelMedium)
                                                    .foregroundStyle(Theme.Colors.textPrimary)
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
