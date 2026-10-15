//
//  LanguageManager.swift
//  Core
//
//  Created for in-app language switching
//

import Foundation
import SwiftUI
import ObjectiveC

@MainActor
public class LanguageManager: ObservableObject {
    public static let shared = LanguageManager()
    
    @Published public var currentLanguage: String {
        didSet {
            UserDefaults.standard.set(currentLanguage, forKey: "AppLanguage")
            UserDefaults.standard.set([currentLanguage], forKey: "AppleLanguages")
            UserDefaults.standard.synchronize()
            LanguageOverrideBundle.apply(language: currentLanguage)
            NotificationCenter.default.post(name: .languageChanged, object: currentLanguage)
        }
    }
    
    private init() {
        if let savedLanguage = UserDefaults.standard.string(forKey: "AppLanguage") {
            self.currentLanguage = savedLanguage
            UserDefaults.standard.set([savedLanguage], forKey: "AppleLanguages")
            UserDefaults.standard.synchronize()
        } else {
            self.currentLanguage = Locale.preferredLanguages.first ?? "en"
        }
        LanguageOverrideBundle.apply(language: currentLanguage)
    }
    
    public func setLanguage(_ languageCode: String) {
        currentLanguage = languageCode
    }
    
    public func getBundle(for bundleClass: AnyClass) -> Bundle {
        let mainBundle = Bundle(for: bundleClass)
        guard let path = mainBundle.path(forResource: currentLanguage, ofType: "lproj"),
              let bundle = Bundle(path: path) else {
            return mainBundle
        }
        return bundle
    }
    
    public static var availableLanguages: [(code: String, name: String)] {
        return [
            ("en", "English"),
            ("bo", "བོད་སྐད་"),
            ("ar", "العربية"),
            ("fa", "فارسی"),
            ("uk", "Українська"),
            ("zh-HK", "繁體中文"),
            ("vi", "Tiếng Việt"),
            ("lv", "Latviešu"),
            ("uz", "Oʻzbekcha")
        ]
    }
}

/// Serves localized strings from the selected language's `.lproj`, so a language picked in the
/// app takes effect immediately. iOS itself only reads `AppleLanguages` at launch.
private final class LanguageOverrideBundle: Bundle, @unchecked Sendable {
    nonisolated(unsafe) private static var languageBundleKey: UInt8 = 0

    override func localizedString(forKey key: String, value: String?, table tableName: String?) -> String {
        guard let languageBundle = objc_getAssociatedObject(self, &Self.languageBundleKey) as? Bundle else {
            return super.localizedString(forKey: key, value: value, table: tableName)
        }
        return languageBundle.localizedString(forKey: key, value: value, table: tableName)
    }

    /// Covers the app and its own module frameworks that ship translations; system frameworks
    /// are left alone.
    static func apply(language: String) {
        let appPath = Bundle.main.bundlePath
        let bundles = [Bundle.main] + Bundle.allFrameworks.filter { $0.bundlePath.hasPrefix(appPath) }
        for bundle in bundles where !bundle.localizations.isEmpty {
            if !(bundle is LanguageOverrideBundle) {
                object_setClass(bundle, LanguageOverrideBundle.self)
            }
            let languageBundle = bundle.path(forResource: language, ofType: "lproj").flatMap(Bundle.init(path:))
            objc_setAssociatedObject(bundle, &languageBundleKey, languageBundle, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}

public extension Notification.Name {
    static let languageChanged = Notification.Name("languageChanged")
}
