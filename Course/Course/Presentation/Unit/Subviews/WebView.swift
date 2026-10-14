//
//  WebView.swift
//  Course
//
//  Created by  Stepanok Ivan on 30.05.2023.
//

import SwiftUI
import Swinject
import Core
import Theme

struct WebViewHeader {
    let title: String
    let icon: Image
    let position: Int
    let total: Int
}

extension BlockType {
    /// Icon for the unit card header. `image` is shared with other screens and draws text
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
    let position: Int
    let total: Int

    var body: some View {
        HStack(spacing: 4) {
            ForEach(1...max(total, 1), id: \.self) { index in
                Capsule()
                    .fill(index == position ? Theme.Colors.accentColor : Theme.Colors.cardViewStroke)
                    .frame(height: 4)
            }
        }
        .padding(.horizontal, 4)
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("\(position) / \(total)")
    }
}

struct WebView: View {
    let url: String
    let localUrl: String?
    let injections: [WebviewInjection]
    let blockID: String
    var roundedBackgroundEnabled: Bool = true
    var header: WebViewHeader?
    var bottomPadding: CGFloat = 16

    private let cornerRadius: CGFloat = 20

    var body: some View {
        if roundedBackgroundEnabled, let header {
            VStack(spacing: 12) {
                if header.total > 1 {
                    UnitProgressDashes(position: header.position, total: header.total)
                }
                VStack(spacing: 0) {
                    UnitBlockHeaderView(header: header)
                    Rectangle()
                        .fill(Theme.Colors.cardViewStroke.opacity(0.6))
                        .frame(height: 1)
                    webUnitView
                }
                .background(Theme.Colors.background)
                .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
                .overlay(
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(Theme.Colors.cardViewStroke.opacity(0.6), lineWidth: 1)
                )
                .shadow(color: Theme.Colors.shadowColor, radius: 12, x: 0, y: 4)
            }
            .padding(.horizontal, 16)
            .padding(.top, 8)
            .padding(.bottom, bottomPadding)
        } else {
            VStack(spacing: 0) {
                webUnitView
                if roundedBackgroundEnabled {
                    Spacer(minLength: 5)
                }
            }
        }
    }

    private var webUnitView: some View {
        WebUnitView(
            url: url,
            dataUrl: localUrl,
            viewModel: Container.shared.resolve(WebUnitViewModel.self)!,
            connectivity: Connectivity(),
            injections: injections,
            blockID: blockID
        )
    }
}

/// Icon, title and position of the current block, shown at the top of a unit page.
struct UnitBlockHeaderView: View {
    let header: WebViewHeader

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
                    Text("\(header.position) / \(header.total)")
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
