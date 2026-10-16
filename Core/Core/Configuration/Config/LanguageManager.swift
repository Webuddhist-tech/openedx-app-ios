//
//  LanguageManager.swift
//  Core
//
//  Created for in-app language switching
//

import Foundation
import SwiftUI

@MainActor
public class LanguageManager: ObservableObject {
    public static let shared = LanguageManager()

    /// UserDefaults key of the language picked in the app. The generated SwiftGen strings read it
    /// on every lookup so text follows a change immediately; the same key is written in
    /// Template/strings-structured-swift5.stencil and must stay in sync with it.
    public nonisolated static let storageKey = "AppLanguage"

    /// Locale for formatting dates and numbers shown to the learner: the language picked in the
    /// app, or the system's when none was picked. `Locale.current` only changes on relaunch.
    public nonisolated static var appLocale: Locale {
        UserDefaults.standard.string(forKey: storageKey).map(Locale.init(identifier:)) ?? .current
    }

    @Published public var currentLanguage: String {
        didSet {
            UserDefaults.standard.set(currentLanguage, forKey: Self.storageKey)
            UserDefaults.standard.set([currentLanguage], forKey: "AppleLanguages")
            UserDefaults.standard.synchronize()
            NotificationCenter.default.post(name: .languageChanged, object: currentLanguage)
        }
    }
    
    private init() {
        if let savedLanguage = UserDefaults.standard.string(forKey: Self.storageKey) {
            self.currentLanguage = savedLanguage
            UserDefaults.standard.set([savedLanguage], forKey: "AppleLanguages")
            UserDefaults.standard.synchronize()
        } else {
            // Map e.g. "en-US" to "en" so the Language screen ticks the system language.
            let preferred = Locale.preferredLanguages.first
            self.currentLanguage = Self.supportedLanguageCode(for: preferred) ?? preferred ?? "en"
        }
    }

    /// The code from `availableLanguages` matching a system language identifier, if any.
    static func supportedLanguageCode(for identifier: String?) -> String? {
        guard let identifier else { return nil }
        let codes = availableLanguages.map(\.code)
        if codes.contains(identifier) { return identifier }
        let locale = Locale(identifier: identifier)
        guard let language = locale.language.languageCode?.identifier else { return nil }
        if let region = locale.region?.identifier, codes.contains("\(language)-\(region)") {
            return "\(language)-\(region)"
        }
        return codes.contains(language) ? language : nil
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

public extension Notification.Name {
    static let languageChanged = Notification.Name("languageChanged")
}
