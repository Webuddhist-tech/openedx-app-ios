//
//  WebView.swift
//  Course
//
//  Created by  Stepanok Ivan on 30.05.2023.
//

import SwiftUI
import Swinject
import Core
import Theme

struct WebView: View {
    let url: String
    let localUrl: String?
    let injections: [WebviewInjection]
    let blockID: String
    /// When set, the page is shown in a rounded card under this header.
    var header: UnitBlockHeader?
    var bottomPadding: CGFloat = 16

    private let cornerRadius: CGFloat = 20

    var body: some View {
        if let header {
            VStack(spacing: 12) {
                if header.total > 1 {
                    UnitProgressDashes(header: header)
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
            webUnitView
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
