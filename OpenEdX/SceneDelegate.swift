//
//  SceneDelegate.swift
//  OpenEdX
//

import UIKit

/// iOS 27+ refuses to launch apps built with the latest SDK that don't adopt the UIScene lifecycle.
/// The scene owns the window; app-wide setup stays in `AppDelegate`.
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = scene as? UIWindowScene else { return }
        window = AppDelegate.shared.makeMainWindow(for: windowScene)

        // A URL that cold-launched the app (e.g. an OAuth redirect) arrives here instead of in openURLContexts.
        openURLs(connectionOptions.urlContexts)
    }

    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        openURLs(URLContexts)
    }

    // With scenes, UIKit no longer calls application(_:open:options:), so forward URLs to it
    // to keep Google/Facebook/Microsoft sign-in and deep links working.
    private func openURLs(_ contexts: Set<UIOpenURLContext>) {
        for context in contexts {
            var options: [UIApplication.OpenURLOptionsKey: Any] = [:]
            options[.sourceApplication] = context.options.sourceApplication
            options[.annotation] = context.options.annotation
            options[.openInPlace] = context.options.openInPlace
            _ = AppDelegate.shared.application(UIApplication.shared, open: context.url, options: options)
        }
    }
}
