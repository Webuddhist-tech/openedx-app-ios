//
//  BackNavigationButton.swift
//  Core
//
//  Created by Vadim Kuznetsov on 3.04.24.
//

import SwiftUI
import Theme

class BackButton: UIButton {
    override func menuAttachmentPoint(for configuration: UIContextMenuConfiguration) -> CGPoint {
        return .zero
    }
}

public struct BackNavigationButtonRepresentable: UIViewRepresentable {
    @ObservedObject var viewModel: BackNavigationButtonViewModel
    var action: (() -> Void)?
    var color: Color

    init(action: (() -> Void)? = nil, color: Color, viewModel: BackNavigationButtonViewModel) {
        self.viewModel = viewModel
        self.action = action
        self.color = color
    }
    
    public func makeUIView(context: Context) -> UIButton {
        let button = BackButton(type: .custom)
        button.configuration = Self.configuration(color: color)
        button.addTarget(context.coordinator, action: #selector(Coordinator.buttonAction), for: .touchUpInside)
        button.accessibilityIdentifier = "back_button"
        return button
    }

    /// Matches the system back button: a chevron in a glass circle (blurred material before iOS 26).
    private static func configuration(color: Color) -> UIButton.Configuration {
        var configuration: UIButton.Configuration
        if #available(iOS 26.0, *) {
            configuration = .glass()
        } else {
            configuration = .plain()
            configuration.background.visualEffect = UIBlurEffect(style: .systemThinMaterial)
        }
        configuration.cornerStyle = .capsule
        configuration.image = UIImage(
            systemName: "chevron.left",
            withConfiguration: UIImage.SymbolConfiguration(pointSize: 17, weight: .semibold)
        )
        configuration.baseForegroundColor = UIColor(color)
        return configuration
    }

    public func updateUIView(_ button: UIButton, context: Context) {
        button.configuration?.baseForegroundColor = UIColor(color)
        var actions: [UIAction] = []
        for item in viewModel.items {
            let action = UIAction(title: item.title) {[weak viewModel] _ in
                viewModel?.navigateTo(item: item)
            }
            actions.append(action)
        }
        button.menu = UIMenu(title: "", children: actions)
    }
    
    public func makeCoordinator() -> Coordinator {
        Coordinator(action: action)
    }
    
    public class Coordinator: NSObject {
        var action: (() -> Void)?
        init(action: (() -> Void)?) {
            self.action = action
        }
        
        @objc func buttonAction() {
            action?()
        }
    }
}

public struct BackNavigationButton: View {
    /// Same size as the system back button.
    public static let size: CGFloat = 44

    @StateObject var viewModel = BackNavigationButtonViewModel()
    private let color: Color
    private let action: (() -> Void)?
    
    public init(
        color: Color = Theme.Colors.textPrimary,
        action: (() -> Void)? = nil
    ) {
        self.color = color
        self.action = action
    }
    
    public var body: some View {
        BackNavigationButtonRepresentable(action: action, color: color, viewModel: viewModel)
            .frame(width: Self.size, height: Self.size)
            .accessibilityIdentifier("back_button")
            .accessibilityLabel(CoreLocalization.back)
        .onAppear {
            viewModel.loadItems()
        }
        
    }
}
#if DEBUG
struct BackNavigationButton_Previews: PreviewProvider {
    static var previews: some View {
        BackNavigationButton()
    }
}
#endif
