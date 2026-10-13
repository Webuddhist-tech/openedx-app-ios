//
//  CourseSessionView.swift
//  Course
//
//  Created by tenkalden on 13.10.2026.
//

import SwiftUI
import Core
import Theme

/// One scheduled section session on the Dates screen, shown as a card so it stands apart
/// from course dates. Sessions are informational: no status badge, no link and no tap action.
struct CourseSessionView: View {
    let session: CourseSessionBlock

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            liveTag
            Text(session.title)
                .font(Theme.Fonts.titleMedium)
                .foregroundStyle(Theme.Colors.textPrimary)
                .fixedSize(horizontal: false, vertical: true)
            VStack(alignment: .leading, spacing: 4) {
                if let days = session.daysText() {
                    detailRow(icon: "calendar", text: days, isEmphasized: true)
                }
                if let time = session.timeText() {
                    detailRow(icon: "clock", text: time, isEmphasized: true)
                }
                if !session.instructor.isEmpty {
                    detailRow(icon: "person", text: session.instructor)
                        .accessibilityLabel(CourseLocalization.CourseDates.sessionInstructor(session.instructor))
                }
                if !session.toolsRequired.isEmpty {
                    detailRow(icon: "wrench.and.screwdriver", text: session.toolsRequired)
                        .accessibilityLabel(
                            CourseLocalization.CourseDates.sessionToolsRequired(session.toolsRequired)
                        )
                }
                if let date = session.contentAvailableFromText() {
                    detailRow(
                        icon: "info.circle",
                        text: CourseLocalization.CourseDates.sessionContentAvailableFrom(date)
                    )
                }
            }
            if !session.notes.isEmpty {
                Divider()
                    .overlay(Theme.Colors.cardViewStroke)
                    .padding(.top, 2)
                Text(session.notes)
                    .font(Theme.Fonts.bodySmall)
                    .foregroundStyle(Theme.Colors.textSecondary)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
        .padding(.horizontal, 14)
        .padding(.vertical, 12)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Theme.Colors.cardViewBackground)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Theme.Colors.cardViewStroke, lineWidth: 1)
        )
        .accessibilityElement(children: .contain)
        .padding(.trailing, 15)
        .padding(.bottom, 15)
    }

    private var liveTag: some View {
        Label(CourseLocalization.CourseDates.sessionLive, systemImage: "dot.radiowaves.left.and.right")
            .font(Theme.Fonts.labelSmall)
            .foregroundStyle(Theme.Colors.accentColor)
            .padding(.horizontal, 8)
            .padding(.vertical, 3)
            .background(
                Capsule().fill(Theme.Colors.accentColor.opacity(0.12))
            )
    }

    private func detailRow(icon: String, text: String, isEmphasized: Bool = false) -> some View {
        HStack(alignment: .firstTextBaseline, spacing: 8) {
            Image(systemName: icon)
                .font(.system(size: 13))
                .frame(width: 18)
                .foregroundStyle(Theme.Colors.textSecondary)
                .accessibilityHidden(true)
            Text(text)
                .font(isEmphasized ? Theme.Fonts.labelLarge : Theme.Fonts.labelMedium)
                .foregroundStyle(isEmphasized ? Theme.Colors.textPrimary : Theme.Colors.textSecondary)
                .fixedSize(horizontal: false, vertical: true)
        }
        .accessibilityElement(children: .combine)
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
