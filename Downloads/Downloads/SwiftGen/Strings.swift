// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
public enum DownloadsLocalization {
  public enum Downloads {
    /// Manage Download Settings
    public static var manageDownloadSettings: String { return DownloadsLocalization.tr("Localizable", "DOWNLOADS.MANAGE_DOWNLOAD_SETTINGS", fallback: "Manage Download Settings") }
    /// Localizable.strings
    ///   Downloads
    /// 
    ///   Created by Ivan Stepanok on 22.02.2025.
    public static var title: String { return DownloadsLocalization.tr("Localizable", "DOWNLOADS.TITLE", fallback: "Downloads") }
    public enum Cell {
      /// All %@ downloaded
      public static func allDownloaded(_ p1: Any) -> String {
        return DownloadsLocalization.tr("Localizable", "DOWNLOADS.CELL.ALL_DOWNLOADED", String(describing: p1), fallback: "All %@ downloaded")
      }
      /// %@ available
      public static func available(_ p1: Any) -> String {
        return DownloadsLocalization.tr("Localizable", "DOWNLOADS.CELL.AVAILABLE", String(describing: p1), fallback: "%@ available")
      }
      /// Download course
      public static var downloadCourse: String { return DownloadsLocalization.tr("Localizable", "DOWNLOADS.CELL.DOWNLOAD_COURSE", fallback: "Download course") }
      /// %@ downloaded
      public static func downloaded(_ p1: Any) -> String {
        return DownloadsLocalization.tr("Localizable", "DOWNLOADS.CELL.DOWNLOADED", String(describing: p1), fallback: "%@ downloaded")
      }
      /// Downloading
      public static var downloading: String { return DownloadsLocalization.tr("Localizable", "DOWNLOADS.CELL.DOWNLOADING", fallback: "Downloading") }
      /// Loading course structure...
      public static var loadingCourseStructure: String { return DownloadsLocalization.tr("Localizable", "DOWNLOADS.CELL.LOADING_COURSE_STRUCTURE", fallback: "Loading course structure...") }
    }
    public enum NoCoursesToDownload {
      /// You currently have no courses with downloadable content.
      public static var description: String { return DownloadsLocalization.tr("Localizable", "DOWNLOADS.NO_COURSES_TO_DOWNLOAD.DESCRIPTION", fallback: "You currently have no courses with downloadable content.") }
      /// No Courses with Downloadable Content
      public static var title: String { return DownloadsLocalization.tr("Localizable", "DOWNLOADS.NO_COURSES_TO_DOWNLOAD.TITLE", fallback: "No Courses with Downloadable Content") }
    }
  }
  public enum MenuOption {
    /// Cancel download
    public static var cancel: String { return DownloadsLocalization.tr("Localizable", "MENU_OPTION.CANCEL", fallback: "Cancel download") }
    /// Remove course downloads
    public static var remove: String { return DownloadsLocalization.tr("Localizable", "MENU_OPTION.REMOVE", fallback: "Remove course downloads") }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension DownloadsLocalization {
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
