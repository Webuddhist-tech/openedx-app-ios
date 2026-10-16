// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
public enum ProfileLocalization {
  /// About Me
  public static var about: String { return ProfileLocalization.tr("Localizable", "ABOUT", fallback: "About Me") }
  /// Bio:
  public static var bio: String { return ProfileLocalization.tr("Localizable", "BIO", fallback: "Bio:") }
  /// Contact support
  public static var contact: String { return ProfileLocalization.tr("Localizable", "CONTACT", fallback: "Contact support") }
  /// Cookie policy
  public static var cookiePolicy: String { return ProfileLocalization.tr("Localizable", "COOKIE_POLICY", fallback: "Cookie policy") }
  /// Dates & Calendar
  public static var datesAndCalendar: String { return ProfileLocalization.tr("Localizable", "DATES_AND_CALENDAR", fallback: "Dates & Calendar") }
  /// Do not sell my personal information
  public static var doNotSellInformation: String { return ProfileLocalization.tr("Localizable", "DO_NOT_SELL_INFORMATION", fallback: "Do not sell my personal information") }
  /// Edit Profile
  public static var editProfile: String { return ProfileLocalization.tr("Localizable", "EDIT_PROFILE", fallback: "Edit Profile") }
  /// View FAQ
  public static var faqTitle: String { return ProfileLocalization.tr("Localizable", "FAQ_TITLE", fallback: "View FAQ") }
  /// full profile
  public static var fullProfile: String { return ProfileLocalization.tr("Localizable", "FULL_PROFILE", fallback: "full profile") }
  /// Profile info
  public static var info: String { return ProfileLocalization.tr("Localizable", "INFO", fallback: "Profile info") }
  /// limited profile
  public static var limitedProfile: String { return ProfileLocalization.tr("Localizable", "LIMITED_PROFILE", fallback: "limited profile") }
  /// Log out
  public static var logout: String { return ProfileLocalization.tr("Localizable", "LOGOUT", fallback: "Log out") }
  /// Manage Account
  public static var manageAccount: String { return ProfileLocalization.tr("Localizable", "MANAGE_ACCOUNT", fallback: "Manage Account") }
  /// Privacy policy
  public static var privacy: String { return ProfileLocalization.tr("Localizable", "PRIVACY", fallback: "Privacy policy") }
  /// Settings
  public static var settings: String { return ProfileLocalization.tr("Localizable", "SETTINGS", fallback: "Settings") }
  /// Video settings
  public static var settingsVideo: String { return ProfileLocalization.tr("Localizable", "SETTINGS_VIDEO", fallback: "Video settings") }
  /// Support info
  public static var supportInfo: String { return ProfileLocalization.tr("Localizable", "SUPPORT_INFO", fallback: "Support info") }
  /// Switch to
  public static var switchTo: String { return ProfileLocalization.tr("Localizable", "SWITCH_TO", fallback: "Switch to") }
  /// Terms of use
  public static var terms: String { return ProfileLocalization.tr("Localizable", "TERMS", fallback: "Terms of use") }
  /// Localizable.strings
  ///   Profile
  /// 
  ///   Created by  Stepanok Ivan on 23.09.2022.
  public static var title: String { return ProfileLocalization.tr("Localizable", "TITLE", fallback: "Profile") }
  /// Year of birth:
  public static var yearOfBirth: String { return ProfileLocalization.tr("Localizable", "YEAR_OF_BIRTH", fallback: "Year of birth:") }
  public enum AssignmentStatus {
    /// Sync Failed
    public static var failed: String { return ProfileLocalization.tr("Localizable", "ASSIGNMENT_STATUS.FAILED", fallback: "Sync Failed") }
    /// Offline
    public static var offline: String { return ProfileLocalization.tr("Localizable", "ASSIGNMENT_STATUS.OFFLINE", fallback: "Offline") }
    /// Synced
    public static var synced: String { return ProfileLocalization.tr("Localizable", "ASSIGNMENT_STATUS.SYNCED", fallback: "Synced") }
    /// Syncing to calendar...
    public static var syncing: String { return ProfileLocalization.tr("Localizable", "ASSIGNMENT_STATUS.SYNCING", fallback: "Syncing to calendar...") }
  }
  public enum Calendar {
    /// Account
    public static var account: String { return ProfileLocalization.tr("Localizable", "CALENDAR.ACCOUNT", fallback: "Account") }
    /// Begin Syncing
    public static var beginSyncing: String { return ProfileLocalization.tr("Localizable", "CALENDAR.BEGIN_SYNCING", fallback: "Begin Syncing") }
    /// Calendar Name
    public static var calendarName: String { return ProfileLocalization.tr("Localizable", "CALENDAR.CALENDAR_NAME", fallback: "Calendar Name") }
    /// Cancel
    public static var cancel: String { return ProfileLocalization.tr("Localizable", "CALENDAR.CANCEL", fallback: "Cancel") }
    /// Change Sync Options
    public static var changeSyncOptions: String { return ProfileLocalization.tr("Localizable", "CALENDAR.CHANGE_SYNC_OPTIONS", fallback: "Change Sync Options") }
    /// Color
    public static var color: String { return ProfileLocalization.tr("Localizable", "CALENDAR.COLOR", fallback: "Color") }
    /// %@ Course Dates
    public static func courseDates(_ p1: Any) -> String {
      return ProfileLocalization.tr("Localizable", "CALENDAR.COURSE_DATES", String(describing: p1), fallback: "%@ Course Dates")
    }
    /// New Calendar
    public static var newCalendar: String { return ProfileLocalization.tr("Localizable", "CALENDAR.NEW_CALENDAR", fallback: "New Calendar") }
    /// Upcoming assignments for active courses will appear on this calendar
    public static var upcomingAssignments: String { return ProfileLocalization.tr("Localizable", "CALENDAR.UPCOMING_ASSIGNMENTS", fallback: "Upcoming assignments for active courses will appear on this calendar") }
    public enum Dropdown {
      /// iCloud
      public static var icloud: String { return ProfileLocalization.tr("Localizable", "CALENDAR.DROPDOWN.ICLOUD", fallback: "iCloud") }
      /// Local
      public static var local: String { return ProfileLocalization.tr("Localizable", "CALENDAR.DROPDOWN.LOCAL", fallback: "Local") }
    }
    public enum DropdownColor {
      /// Accent
      public static var accent: String { return ProfileLocalization.tr("Localizable", "CALENDAR.DROPDOWN_COLOR.ACCENT", fallback: "Accent") }
      /// Blue
      public static var blue: String { return ProfileLocalization.tr("Localizable", "CALENDAR.DROPDOWN_COLOR.BLUE", fallback: "Blue") }
      /// Brown
      public static var brown: String { return ProfileLocalization.tr("Localizable", "CALENDAR.DROPDOWN_COLOR.BROWN", fallback: "Brown") }
      /// Green
      public static var green: String { return ProfileLocalization.tr("Localizable", "CALENDAR.DROPDOWN_COLOR.GREEN", fallback: "Green") }
      /// Orange
      public static var orange: String { return ProfileLocalization.tr("Localizable", "CALENDAR.DROPDOWN_COLOR.ORANGE", fallback: "Orange") }
      /// Purple
      public static var purple: String { return ProfileLocalization.tr("Localizable", "CALENDAR.DROPDOWN_COLOR.PURPLE", fallback: "Purple") }
      /// Red
      public static var red: String { return ProfileLocalization.tr("Localizable", "CALENDAR.DROPDOWN_COLOR.RED", fallback: "Red") }
      /// Yellow
      public static var yellow: String { return ProfileLocalization.tr("Localizable", "CALENDAR.DROPDOWN_COLOR.YELLOW", fallback: "Yellow") }
    }
  }
  public enum CalendarDialog {
    /// Calendar Access
    public static var calendarAccess: String { return ProfileLocalization.tr("Localizable", "CALENDAR_DIALOG.CALENDAR_ACCESS", fallback: "Calendar Access") }
    /// To show upcoming assignments and course milestones on your calendar, we need permission to access your calendar.
    public static var calendarAccessDescription: String { return ProfileLocalization.tr("Localizable", "CALENDAR_DIALOG.CALENDAR_ACCESS_DESCRIPTION", fallback: "To show upcoming assignments and course milestones on your calendar, we need permission to access your calendar.") }
    /// Cancel
    public static var cancel: String { return ProfileLocalization.tr("Localizable", "CALENDAR_DIALOG.CANCEL", fallback: "Cancel") }
    /// Disable Calendar Sync
    public static var disableCalendarSync: String { return ProfileLocalization.tr("Localizable", "CALENDAR_DIALOG.DISABLE_CALENDAR_SYNC", fallback: "Disable Calendar Sync") }
    /// Disabling calendar sync will delete the calendar “%@”. You can turn calendar sync back on at any time.
    public static func disableCalendarSyncDescription(_ p1: Any) -> String {
      return ProfileLocalization.tr("Localizable", "CALENDAR_DIALOG.DISABLE_CALENDAR_SYNC_DESCRIPTION", String(describing: p1), fallback: "Disabling calendar sync will delete the calendar “%@”. You can turn calendar sync back on at any time.")
    }
    /// Disable Syncing
    public static var disableSyncing: String { return ProfileLocalization.tr("Localizable", "CALENDAR_DIALOG.DISABLE_SYNCING", fallback: "Disable Syncing") }
    /// Grant Calendar Access
    public static var grantCalendarAccess: String { return ProfileLocalization.tr("Localizable", "CALENDAR_DIALOG.GRANT_CALENDAR_ACCESS", fallback: "Grant Calendar Access") }
  }
  public enum CalendarSync {
    /// Set Up Calendar Sync
    public static var button: String { return ProfileLocalization.tr("Localizable", "CALENDAR_SYNC.BUTTON", fallback: "Set Up Calendar Sync") }
    /// Set up calendar sync to show your upcoming assignments and course milestones on your calendar. New assignments and shifted course dates will sync automatically
    public static var description: String { return ProfileLocalization.tr("Localizable", "CALENDAR_SYNC.DESCRIPTION", fallback: "Set up calendar sync to show your upcoming assignments and course milestones on your calendar. New assignments and shifted course dates will sync automatically") }
    /// Calendar Sync
    public static var title: String { return ProfileLocalization.tr("Localizable", "CALENDAR_SYNC.TITLE", fallback: "Calendar Sync") }
  }
  public enum CoursesToSync {
    /// Disabling sync for a course will remove all events connected to the course from your synced calendar.
    public static var description: String { return ProfileLocalization.tr("Localizable", "COURSES_TO_SYNC.DESCRIPTION", fallback: "Disabling sync for a course will remove all events connected to the course from your synced calendar.") }
    /// Hide Inactive Courses
    public static var hideInactiveCourses: String { return ProfileLocalization.tr("Localizable", "COURSES_TO_SYNC.HIDE_INACTIVE_COURSES", fallback: "Hide Inactive Courses") }
    /// Automatically remove events from courses you haven’t viewed in the last month
    public static var hideInactiveCoursesDescription: String { return ProfileLocalization.tr("Localizable", "COURSES_TO_SYNC.HIDE_INACTIVE_COURSES_DESCRIPTION", fallback: "Automatically remove events from courses you haven’t viewed in the last month") }
    /// Inactive
    public static var inactive: String { return ProfileLocalization.tr("Localizable", "COURSES_TO_SYNC.INACTIVE", fallback: "Inactive") }
    /// Syncing %d Courses
    public static func syncingCourses(_ p1: Int) -> String {
      return ProfileLocalization.tr("Localizable", "COURSES_TO_SYNC.SYNCING_COURSES", p1, fallback: "Syncing %d Courses")
    }
    /// Courses to Sync
    public static var title: String { return ProfileLocalization.tr("Localizable", "COURSES_TO_SYNC.TITLE", fallback: "Courses to Sync") }
  }
  public enum CourseCalendarSync {
    /// Course Calendar Sync
    public static var title: String { return ProfileLocalization.tr("Localizable", "COURSE_CALENDAR_SYNC.TITLE", fallback: "Course Calendar Sync") }
    public enum Button {
      /// Change Sync Options
      public static var changeSyncOptions: String { return ProfileLocalization.tr("Localizable", "COURSE_CALENDAR_SYNC.BUTTON.CHANGE_SYNC_OPTIONS", fallback: "Change Sync Options") }
      /// Reconnect Calendar
      public static var reconnect: String { return ProfileLocalization.tr("Localizable", "COURSE_CALENDAR_SYNC.BUTTON.RECONNECT", fallback: "Reconnect Calendar") }
    }
    public enum Description {
      /// Please reconnect your calendar to resume syncing
      public static var reconnectRequired: String { return ProfileLocalization.tr("Localizable", "COURSE_CALENDAR_SYNC.DESCRIPTION.RECONNECT_REQUIRED", fallback: "Please reconnect your calendar to resume syncing") }
      /// Currently syncing events to your calendar
      public static var syncing: String { return ProfileLocalization.tr("Localizable", "COURSE_CALENDAR_SYNC.DESCRIPTION.SYNCING", fallback: "Currently syncing events to your calendar") }
    }
  }
  public enum DatesAndCalendar {
    /// Dates & Calendar
    public static var title: String { return ProfileLocalization.tr("Localizable", "DATES_AND_CALENDAR.TITLE", fallback: "Dates & Calendar") }
  }
  public enum DeleteAccount {
    /// Are you sure you want to 
    public static var areYouSure: String { return ProfileLocalization.tr("Localizable", "DELETE_ACCOUNT.ARE_YOU_SURE", fallback: "Are you sure you want to ") }
    /// Back to profile
    public static var backToProfile: String { return ProfileLocalization.tr("Localizable", "DELETE_ACCOUNT.BACK_TO_PROFILE", fallback: "Back to profile") }
    /// Yes, delete account
    public static var confirm: String { return ProfileLocalization.tr("Localizable", "DELETE_ACCOUNT.CONFIRM", fallback: "Yes, delete account") }
    /// To confirm this action, please enter your account password.
    public static var description: String { return ProfileLocalization.tr("Localizable", "DELETE_ACCOUNT.DESCRIPTION", fallback: "To confirm this action, please enter your account password.") }
    /// The password is incorrect. Please try again.
    public static var incorrectPassword: String { return ProfileLocalization.tr("Localizable", "DELETE_ACCOUNT.INCORRECT_PASSWORD", fallback: "The password is incorrect. Please try again.") }
    /// Password
    public static var password: String { return ProfileLocalization.tr("Localizable", "DELETE_ACCOUNT.PASSWORD", fallback: "Password") }
    /// Enter password
    public static var passwordDescription: String { return ProfileLocalization.tr("Localizable", "DELETE_ACCOUNT.PASSWORD_DESCRIPTION", fallback: "Enter password") }
    /// Delete Account
    public static var title: String { return ProfileLocalization.tr("Localizable", "DELETE_ACCOUNT.TITLE", fallback: "Delete Account") }
    /// delete your account?
    public static var wantToDelete: String { return ProfileLocalization.tr("Localizable", "DELETE_ACCOUNT.WANT_TO_DELETE", fallback: "delete your account?") }
  }
  public enum DeleteAlert {
    /// Do you really want to delete your account?
    public static var text: String { return ProfileLocalization.tr("Localizable", "DELETE_ALERT.TEXT", fallback: "Do you really want to delete your account?") }
    /// Warning!
    public static var title: String { return ProfileLocalization.tr("Localizable", "DELETE_ALERT.TITLE", fallback: "Warning!") }
  }
  public enum DropDownPicker {
    /// Select
    public static var select: String { return ProfileLocalization.tr("Localizable", "DROP_DOWN_PICKER.SELECT", fallback: "Select") }
  }
  public enum Edit {
    /// Delete Account
    public static var deleteAccount: String { return ProfileLocalization.tr("Localizable", "EDIT.DELETE_ACCOUNT", fallback: "Delete Account") }
    /// A limited profile only shares your username and profile photo.
    public static var limitedProfileDescription: String { return ProfileLocalization.tr("Localizable", "EDIT.LIMITED_PROFILE_DESCRIPTION", fallback: "A limited profile only shares your username and profile photo.") }
    /// You must be over 13 years old to have a profile with full access to information.
    public static var tooYongUser: String { return ProfileLocalization.tr("Localizable", "EDIT.TOO_YONG_USER", fallback: "You must be over 13 years old to have a profile with full access to information.") }
    public enum BottomSheet {
      /// Cancel
      public static var cancel: String { return ProfileLocalization.tr("Localizable", "EDIT.BOTTOM_SHEET.CANCEL", fallback: "Cancel") }
      /// Remove photo
      public static var remove: String { return ProfileLocalization.tr("Localizable", "EDIT.BOTTOM_SHEET.REMOVE", fallback: "Remove photo") }
      /// Select from gallery
      public static var select: String { return ProfileLocalization.tr("Localizable", "EDIT.BOTTOM_SHEET.SELECT", fallback: "Select from gallery") }
      /// Change profile image
      public static var title: String { return ProfileLocalization.tr("Localizable", "EDIT.BOTTOM_SHEET.TITLE", fallback: "Change profile image") }
    }
    public enum Fields {
      /// About me:
      public static var aboutMe: String { return ProfileLocalization.tr("Localizable", "EDIT.FIELDS.ABOUT_ME", fallback: "About me:") }
      /// Location
      public static var location: String { return ProfileLocalization.tr("Localizable", "EDIT.FIELDS.LOCATION", fallback: "Location") }
      /// Spoken language
      public static var spokenLangugae: String { return ProfileLocalization.tr("Localizable", "EDIT.FIELDS.SPOKEN_LANGUGAE", fallback: "Spoken language") }
      /// Year of birth
      public static var yearOfBirth: String { return ProfileLocalization.tr("Localizable", "EDIT.FIELDS.YEAR_OF_BIRTH", fallback: "Year of birth") }
    }
  }
  public enum Error {
    /// Cannot send email. It seems your email client is not set up.
    public static var cannotSendEmail: String { return ProfileLocalization.tr("Localizable", "ERROR.CANNOT_SEND_EMAIL", fallback: "Cannot send email. It seems your email client is not set up.") }
  }
  public enum LogoutAlert {
    /// Are you sure you want to log out?
    public static var text: String { return ProfileLocalization.tr("Localizable", "LOGOUT_ALERT.TEXT", fallback: "Are you sure you want to log out?") }
    /// Confirm log out
    public static var title: String { return ProfileLocalization.tr("Localizable", "LOGOUT_ALERT.TITLE", fallback: "Confirm log out") }
  }
  public enum Options {
    /// Show full dates like “January 1, 2021”
    public static var showFullDates: String { return ProfileLocalization.tr("Localizable", "OPTIONS.SHOW_FULL_DATES", fallback: "Show full dates like “January 1, 2021”") }
    /// Show relative dates like “Tomorrow” and “Yesterday”
    public static var showRelativeDates: String { return ProfileLocalization.tr("Localizable", "OPTIONS.SHOW_RELATIVE_DATES", fallback: "Show relative dates like “Tomorrow” and “Yesterday”") }
    /// Options
    public static var title: String { return ProfileLocalization.tr("Localizable", "OPTIONS.TITLE", fallback: "Options") }
    /// Use relative dates
    public static var useRelativeDates: String { return ProfileLocalization.tr("Localizable", "OPTIONS.USE_RELATIVE_DATES", fallback: "Use relative dates") }
  }
  public enum Settings {
    /// Language
    public static var languageTitle: String { return ProfileLocalization.tr("Localizable", "SETTINGS.LANGUAGE_TITLE", fallback: "Language") }
    /// Lower data usage
    public static var quality360Description: String { return ProfileLocalization.tr("Localizable", "SETTINGS.QUALITY_360_DESCRIPTION", fallback: "Lower data usage") }
    /// 360p
    public static var quality360Title: String { return ProfileLocalization.tr("Localizable", "SETTINGS.QUALITY_360_TITLE", fallback: "360p") }
    /// 540p
    public static var quality540Title: String { return ProfileLocalization.tr("Localizable", "SETTINGS.QUALITY_540_TITLE", fallback: "540p") }
    /// Best quality
    public static var quality720Description: String { return ProfileLocalization.tr("Localizable", "SETTINGS.QUALITY_720_DESCRIPTION", fallback: "Best quality") }
    /// 720p
    public static var quality720Title: String { return ProfileLocalization.tr("Localizable", "SETTINGS.QUALITY_720_TITLE", fallback: "720p") }
    /// Recommended
    public static var qualityAutoDescription: String { return ProfileLocalization.tr("Localizable", "SETTINGS.QUALITY_AUTO_DESCRIPTION", fallback: "Recommended") }
    /// Auto
    public static var qualityAutoTitle: String { return ProfileLocalization.tr("Localizable", "SETTINGS.QUALITY_AUTO_TITLE", fallback: "Auto") }
    /// Tap to install required app update
    public static var tapToInstall: String { return ProfileLocalization.tr("Localizable", "SETTINGS.TAP_TO_INSTALL", fallback: "Tap to install required app update") }
    /// Tap to update to version
    public static var tapToUpdate: String { return ProfileLocalization.tr("Localizable", "SETTINGS.TAP_TO_UPDATE", fallback: "Tap to update to version") }
    /// Theme
    public static var themeTitle: String { return ProfileLocalization.tr("Localizable", "SETTINGS.THEME_TITLE", fallback: "Theme") }
    /// Up-to-date
    public static var upToDate: String { return ProfileLocalization.tr("Localizable", "SETTINGS.UP_TO_DATE", fallback: "Up-to-date") }
    /// Version:
    public static var version: String { return ProfileLocalization.tr("Localizable", "SETTINGS.VERSION", fallback: "Version:") }
    /// Auto (Recommended)
    public static var videoQualityDescription: String { return ProfileLocalization.tr("Localizable", "SETTINGS.VIDEO_QUALITY_DESCRIPTION", fallback: "Auto (Recommended)") }
    /// Video streaming quality
    public static var videoQualityTitle: String { return ProfileLocalization.tr("Localizable", "SETTINGS.VIDEO_QUALITY_TITLE", fallback: "Video streaming quality") }
    /// Video settings
    public static var videoSettingsTitle: String { return ProfileLocalization.tr("Localizable", "SETTINGS.VIDEO_SETTINGS_TITLE", fallback: "Video settings") }
    /// Only download content when wi-fi is turned on
    public static var wifiDescription: String { return ProfileLocalization.tr("Localizable", "SETTINGS.WIFI_DESCRIPTION", fallback: "Only download content when wi-fi is turned on") }
    /// Wi-fi only download
    public static var wifiTitle: String { return ProfileLocalization.tr("Localizable", "SETTINGS.WIFI_TITLE", fallback: "Wi-fi only download") }
  }
  public enum Sync {
    /// No Synced Courses
    public static var noSynced: String { return ProfileLocalization.tr("Localizable", "SYNC.NO_SYNCED", fallback: "No Synced Courses") }
    /// No courses are currently being synced to your calendar.
    public static var noSyncedDescription: String { return ProfileLocalization.tr("Localizable", "SYNC.NO_SYNCED_DESCRIPTION", fallback: "No courses are currently being synced to your calendar.") }
  }
  public enum SyncSelector {
    /// Not Synced
    public static var notSynced: String { return ProfileLocalization.tr("Localizable", "SYNC_SELECTOR.NOT_SYNCED", fallback: "Not Synced") }
    /// To Sync
    public static var synced: String { return ProfileLocalization.tr("Localizable", "SYNC_SELECTOR.SYNCED", fallback: "To Sync") }
  }
  public enum UnsavedDataAlert {
    /// Changes you have made will be discarded.
    public static var text: String { return ProfileLocalization.tr("Localizable", "UNSAVED_DATA_ALERT.TEXT", fallback: "Changes you have made will be discarded.") }
    /// Leave without saving?
    public static var title: String { return ProfileLocalization.tr("Localizable", "UNSAVED_DATA_ALERT.TITLE", fallback: "Leave without saving?") }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension ProfileLocalization {
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
