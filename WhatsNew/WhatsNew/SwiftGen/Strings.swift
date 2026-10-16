// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
public enum WhatsNewLocalization {
  /// Done
  public static var buttonDone: String { return WhatsNewLocalization.tr("Localizable", "BUTTON_DONE", fallback: "Done") }
  /// Next
  public static var buttonNext: String { return WhatsNewLocalization.tr("Localizable", "BUTTON_NEXT", fallback: "Next") }
  /// Previous
  public static var buttonPrevious: String { return WhatsNewLocalization.tr("Localizable", "BUTTON_PREVIOUS", fallback: "Previous") }
  /// Localizable.strings
  ///   WhatsNew
  /// 
  ///   Created by  Stepanok Ivan on 18.10.2023.
  public static var title: String { return WhatsNewLocalization.tr("Localizable", "TITLE", fallback: "What's New") }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension WhatsNewLocalization {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let (bundle, locale) = BundleToken.selectedLanguage
    let format = bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: locale, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()

  /// Must match `LanguageManager.storageKey` in Core, which saves the language picked in the app.
  private static let languageKey = "AppLanguage"
  private static let lock = NSLock()
  nonisolated(unsafe) private static var cache: (language: String, bundle: Bundle, locale: Locale)?

  /// Translations and formatting locale for the language picked in the app, falling back to the
  /// system's choice when none was picked or it isn't translated. Cached until the language changes.
  static var selectedLanguage: (bundle: Bundle, locale: Locale) {
    guard let language = UserDefaults.standard.string(forKey: languageKey) else { return (bundle, .current) }
    lock.lock()
    defer { lock.unlock() }
    if let cache, cache.language == language { return (cache.bundle, cache.locale) }
    let languageBundle = bundle.path(forResource: language, ofType: "lproj").flatMap(Bundle.init(path:)) ?? bundle
    let entry = (language: language, bundle: languageBundle, locale: Locale(identifier: language))
    cache = entry
    return (entry.bundle, entry.locale)
  }
}
// swiftlint:enable convenience_type
