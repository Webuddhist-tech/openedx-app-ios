// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
public enum DashboardLocalization {
  /// Search
  public static var search: String { return DashboardLocalization.tr("Localizable", "SEARCH", fallback: "Search") }
  /// Localizable.strings
  ///   Dashboard
  /// 
  ///   Created by  Stepanok Ivan on 20.09.2022.
  public static var title: String { return DashboardLocalization.tr("Localizable", "TITLE", fallback: "Dashboard") }
  public enum Empty {
    /// You are not enrolled in any courses yet.
    public static var subtitle: String { return DashboardLocalization.tr("Localizable", "EMPTY.SUBTITLE", fallback: "You are not enrolled in any courses yet.") }
  }
  public enum Header {
    /// Courses
    public static var courses: String { return DashboardLocalization.tr("Localizable", "HEADER.COURSES", fallback: "Courses") }
    /// Welcome back. Let's keep learning.
    public static var welcomeBack: String { return DashboardLocalization.tr("Localizable", "HEADER.WELCOME_BACK", fallback: "Welcome back. Let's keep learning.") }
  }
  public enum Learn {
    /// All Courses
    public static var allCourses: String { return DashboardLocalization.tr("Localizable", "LEARN.ALL_COURSES", fallback: "All Courses") }
    /// Learn
    public static var title: String { return DashboardLocalization.tr("Localizable", "LEARN.TITLE", fallback: "Learn") }
    /// View All
    public static var viewAll: String { return DashboardLocalization.tr("Localizable", "LEARN.VIEW_ALL", fallback: "View All") }
    /// View All Courses (%@)
    public static func viewAllCourses(_ p1: Any) -> String {
      return DashboardLocalization.tr("Localizable", "LEARN.VIEW_ALL_COURSES", String(describing: p1), fallback: "View All Courses (%@)")
    }
    public enum Category {
      /// All
      public static var all: String { return DashboardLocalization.tr("Localizable", "LEARN.CATEGORY.ALL", fallback: "All") }
      /// Completed
      public static var completed: String { return DashboardLocalization.tr("Localizable", "LEARN.CATEGORY.COMPLETED", fallback: "Completed") }
      /// Expired
      public static var expired: String { return DashboardLocalization.tr("Localizable", "LEARN.CATEGORY.EXPIRED", fallback: "Expired") }
      /// In Progress
      public static var inProgress: String { return DashboardLocalization.tr("Localizable", "LEARN.CATEGORY.IN_PROGRESS", fallback: "In Progress") }
    }
    public enum DropdownMenu {
      /// Courses
      public static var courses: String { return DashboardLocalization.tr("Localizable", "LEARN.DROPDOWN_MENU.COURSES", fallback: "Courses") }
      /// Programs
      public static var programs: String { return DashboardLocalization.tr("Localizable", "LEARN.DROPDOWN_MENU.PROGRAMS", fallback: "Programs") }
    }
    public enum NoCoursesView {
      /// Find a Course
      public static var findACourse: String { return DashboardLocalization.tr("Localizable", "LEARN.NO_COURSES_VIEW.FIND_A_COURSE", fallback: "Find a Course") }
      /// No Completed Courses
      public static var noCompletedCourses: String { return DashboardLocalization.tr("Localizable", "LEARN.NO_COURSES_VIEW.NO_COMPLETED_COURSES", fallback: "No Completed Courses") }
      /// No Courses
      public static var noCourses: String { return DashboardLocalization.tr("Localizable", "LEARN.NO_COURSES_VIEW.NO_COURSES", fallback: "No Courses") }
      /// You are not currently enrolled in any courses, would you like to explore the course catalog?
      public static var noCoursesDescription: String { return DashboardLocalization.tr("Localizable", "LEARN.NO_COURSES_VIEW.NO_COURSES_DESCRIPTION", fallback: "You are not currently enrolled in any courses, would you like to explore the course catalog?") }
      /// No Courses in Progress
      public static var noCoursesInProgress: String { return DashboardLocalization.tr("Localizable", "LEARN.NO_COURSES_VIEW.NO_COURSES_IN_PROGRESS", fallback: "No Courses in Progress") }
      /// No Expired Courses
      public static var noExpiredCourses: String { return DashboardLocalization.tr("Localizable", "LEARN.NO_COURSES_VIEW.NO_EXPIRED_COURSES", fallback: "No Expired Courses") }
    }
    public enum PrimaryCard {
      /// %@ Due in %@ Days
      public static func dueDays(_ p1: Any, _ p2: Any) -> String {
        return DashboardLocalization.tr("Localizable", "LEARN.PRIMARY_CARD.DUE_DAYS", String(describing: p1), String(describing: p2), fallback: "%@ Due in %@ Days")
      }
      /// %@ Assignments Due %@ 
      public static func futureAssignments(_ p1: Any, _ p2: Any) -> String {
        return DashboardLocalization.tr("Localizable", "LEARN.PRIMARY_CARD.FUTURE_ASSIGNMENTS", String(describing: p1), String(describing: p2), fallback: "%@ Assignments Due %@ ")
      }
      /// 1 Past Due Assignment
      public static var onePastAssignment: String { return DashboardLocalization.tr("Localizable", "LEARN.PRIMARY_CARD.ONE_PAST_ASSIGNMENT", fallback: "1 Past Due Assignment") }
      /// %@ Past Due Assignments
      public static func pastAssignments(_ p1: Any) -> String {
        return DashboardLocalization.tr("Localizable", "LEARN.PRIMARY_CARD.PAST_ASSIGNMENTS", String(describing: p1), fallback: "%@ Past Due Assignments")
      }
      /// Resume Course
      public static var resume: String { return DashboardLocalization.tr("Localizable", "LEARN.PRIMARY_CARD.RESUME", fallback: "Resume Course") }
      /// Start Course
      public static var startCourse: String { return DashboardLocalization.tr("Localizable", "LEARN.PRIMARY_CARD.START_COURSE", fallback: "Start Course") }
      /// View Assignments
      public static var viewAssignments: String { return DashboardLocalization.tr("Localizable", "LEARN.PRIMARY_CARD.VIEW_ASSIGNMENTS", fallback: "View Assignments") }
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension DashboardLocalization {
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
