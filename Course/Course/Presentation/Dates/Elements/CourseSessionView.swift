//
//  CourseSessionView.swift
//  Course
//
//  Created by tenkalden on 13.10.2026.
//

import SwiftUI
import Core
import Theme

/// One scheduled section session on the Dates screen, shown as a compact card so it stands
/// apart from course dates. Sessions are informational: no status badge, no link and no tap action.
struct CourseSessionView: View {
    let session: CourseSessionBlock

    var body: some View {
        VStack(alignment: .leading, spacing: 3) {
            Text(session.title)
                .font(Theme.Fonts.titleSmall)
                .foregroundStyle(Theme.Colors.textPrimary)
                .fixedSize(horizontal: false, vertical: true)
            if let when = session.whenText() {
                Text(when)
                    .font(Theme.Fonts.labelMedium)
                    .foregroundStyle(Theme.Colors.textPrimary)
                    .fixedSize(horizontal: false, vertical: true)
            }
            if !session.instructor.isEmpty {
                detail(CourseLocalization.CourseDates.sessionInstructor(session.instructor))
            }
            if !session.toolsRequired.isEmpty {
                detail(CourseLocalization.CourseDates.sessionToolsRequired(session.toolsRequired))
            }
            if let date = session.contentAvailableFromText() {
                detail(CourseLocalization.CourseDates.sessionContentAvailableFrom(date))
            }
            if !session.notes.isEmpty {
                detail(session.notes)
                    .padding(.top, 3)
            }
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 10)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Theme.Colors.cardViewBackground)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Theme.Colors.cardViewStroke, lineWidth: 1)
        )
        .accessibilityElement(children: .combine)
        .padding(.trailing, 15)
        .padding(.bottom, 12)
    }

    private func detail(_ text: String) -> some View {
        Text(text)
            .font(Theme.Fonts.labelMedium)
            .foregroundStyle(Theme.Colors.textSecondary)
            .fixedSize(horizontal: false, vertical: true)
    }
}

#if DEBUG
#Preview {
    CourseSessionView(
        session: CourseSessionBlock(
            id: "block-v1:Sherab+DTIPC+2026+type@chapter+block@abc123",
            title: "Intro to UI/UX",
            startDate: "2026-10-13",
            endDate: "2026-10-14",
            numDays: 2,
            startTime: "08:30",
            endTime: "11:30",
            timezoneAbbr: "IST",
            instructor: "Tenkal",
            toolsRequired: "canva",
            notes: "We will be learning how to edit image and video through canva.",
            contentAvailableFrom: "2026-10-15",
            useRelativeDates: true
        )
    )
    .padding()
}
#endif
