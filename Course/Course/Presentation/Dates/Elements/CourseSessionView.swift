//
//  CourseSessionView.swift
//  Course
//
//  Created by tenkalden on 13.10.2026.
//

import SwiftUI
import Core
import Theme

/// One scheduled section session on the Dates screen. Sessions are informational:
/// no status badge, no link and no tap action.
struct CourseSessionView: View {
    let session: CourseSessionBlock

    var body: some View {
        HStack(alignment: .top) {
            CoreAssets.calendarIcon.swiftUIImage
                .foregroundColor(Theme.Colors.textPrimary)
            VStack(alignment: .leading, spacing: 2) {
                Text(session.title)
                    .font(Theme.Fonts.titleSmall)
                    .foregroundStyle(Theme.Colors.textPrimary)
                    .fixedSize(horizontal: false, vertical: true)
                if let when = session.whenText() {
                    detail(when)
                }
                if !session.instructor.isEmpty {
                    detail(CourseLocalization.CourseDates.sessionInstructor(session.instructor))
                }
                if !session.toolsRequired.isEmpty {
                    detail(CourseLocalization.CourseDates.sessionToolsRequired(session.toolsRequired))
                }
                if !session.notes.isEmpty {
                    detail(session.notes)
                }
                if let date = session.contentAvailableFromText() {
                    detail(CourseLocalization.CourseDates.sessionContentAvailableFrom(date))
                }
            }
            .padding(.bottom, 15)
            Spacer()
        }
        .padding(.trailing, 15)
        .padding(.top, 0.2)
    }

    private func detail(_ text: String) -> some View {
        Text(text)
            .font(Theme.Fonts.labelMedium)
            .foregroundStyle(Theme.Colors.thisWeekTimelineColor)
            .fixedSize(horizontal: false, vertical: true)
    }
}

#if DEBUG
#Preview {
    CourseSessionView(
        session: CourseSessionBlock(
            id: "block-v1:Sherab+DTIPC+2026+type@chapter+block@abc123",
            title: "Day 1: Introduction",
            startDate: "2026-10-12",
            endDate: "2026-10-13",
            numDays: 2,
            startTime: "19:00",
            endTime: "20:30",
            timezoneAbbr: "IST",
            instructor: "Geshe Tenzin",
            toolsRequired: "Workbook, Zoom",
            notes: "Bring a cushion",
            contentAvailableFrom: "2026-10-14",
            useRelativeDates: false
        )
    )
    .padding()
}
#endif
