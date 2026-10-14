//
//  UnitBlockHeaderView.swift
//  Course
//

import SwiftUI
import Core
import Theme

struct UnitBlockHeader {
    let title: String
    let icon: Image
    let position: Int
    let total: Int

    /// Localized "2 of 5" text, also used as the accessibility label for the progress dashes.
    var positionText: String {
        CourseLocalization.Courseware.blockPosition(position.formatted(), total.formatted())
    }
}

extension BlockType {
    /// Icon for the unit block header. `image` is shared with other screens and draws text
    /// blocks as a list, which reads like a menu button in this header.
    var unitHeaderIcon: Image {
        switch self {
        case .multilingualText: Image(systemName: "globe")
        case .problem: Image(systemName: "square.and.pencil")
        case .dragAndDropV2: Image(systemName: "hand.draw")
        case .survey: Image(systemName: "checklist")
        case .openassessment: Image(systemName: "doc.text.magnifyingglass")
        case .peerInstructionTool: Image(systemName: "person.2")
        case .libraryContent: Image(systemName: "books.vertical")
        case .video: Image(systemName: "play.rectangle")
        case .discussion: Image(systemName: "bubble.left.and.bubble.right")
        default: Image(systemName: "doc.text")
        }
    }
}

/// Shows the current block's position within its unit as a row of dashes.
struct UnitProgressDashes: View {
    let header: UnitBlockHeader

    var body: some View {
        HStack(spacing: 4) {
            ForEach(1...max(header.total, 1), id: \.self) { index in
                Capsule()
                    .fill(index == header.position ? Theme.Colors.accentColor : Theme.Colors.cardViewStroke)
                    .frame(height: 4)
            }
        }
        .padding(.horizontal, 4)
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(header.positionText)
    }
}

/// Icon, title and position of the current block, shown at the top of a unit page.
struct UnitBlockHeaderView: View {
    let header: UnitBlockHeader

    var body: some View {
        HStack(spacing: 12) {
            header.icon
                .resizable()
                .scaledToFit()
                .frame(width: 18, height: 18)
                .foregroundStyle(Theme.Colors.accentColor)
                .frame(width: 36, height: 36)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Theme.Colors.accentColor.opacity(0.12))
                )
                .accessibilityHidden(true)
            VStack(alignment: .leading, spacing: 2) {
                Text(header.title)
                    .font(Theme.Fonts.titleMedium)
                    .foregroundStyle(Theme.Colors.textPrimary)
                    .lineLimit(2)
                    .accessibilityAddTraits(.isHeader)
                if header.total > 1 {
                    Text(header.positionText)
                        .font(Theme.Fonts.bodySmall)
                        .foregroundStyle(Theme.Colors.textSecondary)
                        .accessibilityHidden(true)
                }
            }
            Spacer(minLength: 0)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 14)
    }
}
