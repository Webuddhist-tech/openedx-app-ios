// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
public enum AuthLocalization {
  /// Apple
  public static var apple: String { return AuthLocalization.tr("Localizable", "APPLE", fallback: "Apple") }
  /// Continue with:
  public static var continueWith: String { return AuthLocalization.tr("Localizable", "CONTINUE_WITH", fallback: "Continue with:") }
  /// Facebook
  public static var facebook: String { return AuthLocalization.tr("Localizable", "FACEBOOK", fallback: "Facebook") }
  /// Google
  public static var google: String { return AuthLocalization.tr("Localizable", "GOOGLE", fallback: "Google") }
  /// Last sign in
  public static var lastSignIn: String { return AuthLocalization.tr("Localizable", "LAST_SIGN_IN", fallback: "Last sign in") }
  /// Microsoft
  public static var microsoft: String { return AuthLocalization.tr("Localizable", "MICROSOFT", fallback: "Microsoft") }
  /// Or
  public static var or: String { return AuthLocalization.tr("Localizable", "OR", fallback: "Or") }
  /// Or register below:
  public static var orRegisterWith: String { return AuthLocalization.tr("Localizable", "OR_REGISTER_WITH", fallback: "Or register below:") }
  /// Or sign in with email:
  public static var orSignInWith: String { return AuthLocalization.tr("Localizable", "OR_SIGN_IN_WITH", fallback: "Or sign in with email:") }
  public enum Error {
    /// This %@ account is not linked with any %@ account. Please register.
    public static func accountNotRegistered(_ p1: Any, _ p2: Any) -> String {
      return AuthLocalization.tr("Localizable", "ERROR.ACCOUNT_NOT_REGISTERED", String(describing: p1), String(describing: p2), fallback: "This %@ account is not linked with any %@ account. Please register.")
    }
    /// Your account is disabled. Please contact customer support for assistance.
    public static var disabledAccount: String { return AuthLocalization.tr("Localizable", "ERROR.DISABLED_ACCOUNT", fallback: "Your account is disabled. Please contact customer support for assistance.") }
    /// Invalid email address
    public static var invalidEmailAddress: String { return AuthLocalization.tr("Localizable", "ERROR.INVALID_EMAIL_ADDRESS", fallback: "Invalid email address") }
    /// Invalid email or username
    public static var invalidEmailAddressOrUsername: String { return AuthLocalization.tr("Localizable", "ERROR.INVALID_EMAIL_ADDRESS_OR_USERNAME", fallback: "Invalid email or username") }
    /// Invalid password lenght
    public static var invalidPasswordLenght: String { return AuthLocalization.tr("Localizable", "ERROR.INVALID_PASSWORD_LENGHT", fallback: "Invalid password lenght") }
  }
  public enum Forgot {
    /// We have sent a password recover instructions to your email 
    public static var checkDescription: String { return AuthLocalization.tr("Localizable", "FORGOT.CHECK_Description", fallback: "We have sent a password recover instructions to your email ") }
    /// Check your email
    public static var checkTitle: String { return AuthLocalization.tr("Localizable", "FORGOT.CHECK_TITLE", fallback: "Check your email") }
    /// Please enter your log-in or recovery email address below and we will send you an email with instructions.
    public static var description: String { return AuthLocalization.tr("Localizable", "FORGOT.DESCRIPTION", fallback: "Please enter your log-in or recovery email address below and we will send you an email with instructions.") }
    /// Reset password
    public static var request: String { return AuthLocalization.tr("Localizable", "FORGOT.REQUEST", fallback: "Reset password") }
    /// Forgot password
    public static var title: String { return AuthLocalization.tr("Localizable", "FORGOT.TITLE", fallback: "Forgot password") }
  }
  public enum SignIn {
    /// By signing in to this app, you agree to the [%@ End User License Agreement](%@) and [%@ Terms of Service and Honor Code](%@) and you acknowledge that %@ and each Member process your personal data in
    /// accordance with the [Privacy Policy.](%@)
    public static func agreement(_ p1: Any, _ p2: Any, _ p3: Any, _ p4: Any, _ p5: Any, _ p6: Any) -> String {
      return AuthLocalization.tr("Localizable", "SIGN_IN.AGREEMENT", String(describing: p1), String(describing: p2), String(describing: p3), String(describing: p4), String(describing: p5), String(describing: p6), fallback: "By signing in to this app, you agree to the [%@ End User License Agreement](%@) and [%@ Terms of Service and Honor Code](%@) and you acknowledge that %@ and each Member process your personal data in\naccordance with the [Privacy Policy.](%@)")
    }
    /// Email
    public static var email: String { return AuthLocalization.tr("Localizable", "SIGN_IN.EMAIL", fallback: "Email") }
    /// Email or username
    public static var emailOrUsername: String { return AuthLocalization.tr("Localizable", "SIGN_IN.EMAIL_OR_USERNAME", fallback: "Email or username") }
    /// Forgot password?
    public static var forgotPassBtn: String { return AuthLocalization.tr("Localizable", "SIGN_IN.FORGOT_PASS_BTN", fallback: "Forgot password?") }
    /// Localizable.strings
    ///   Authorization
    /// 
    ///   Created by Vladimir Chekyrta on 13.09.2022.
    public static var logInTitle: String { return AuthLocalization.tr("Localizable", "SIGN_IN.LOG_IN_TITLE", fallback: "Sign in") }
    /// Password
    public static var password: String { return AuthLocalization.tr("Localizable", "SIGN_IN.PASSWORD", fallback: "Password") }
    /// Start today to build your career with confidence
    public static var ssoHeading: String { return AuthLocalization.tr("Localizable", "SIGN_IN.SSO_HEADING", fallback: "Start today to build your career with confidence") }
    /// Log in through the national unified sign-on service
    public static var ssoLogInSubtitle: String { return AuthLocalization.tr("Localizable", "SIGN_IN.SSO_LOG_IN_SUBTITLE", fallback: "Log in through the national unified sign-on service") }
    /// Sign in
    public static var ssoLogInTitle: String { return AuthLocalization.tr("Localizable", "SIGN_IN.SSO_LOG_IN_TITLE", fallback: "Sign in") }
    /// An integrated set of knowledge and empowerment programs to develop the components of the endowment sector and its workers
    public static var ssoSupportingText: String { return AuthLocalization.tr("Localizable", "SIGN_IN.SSO_SUPPORTING_TEXT", fallback: "An integrated set of knowledge and empowerment programs to develop the components of the endowment sector and its workers") }
    /// Welcome back! Sign in to access your courses.
    public static var welcomeBack: String { return AuthLocalization.tr("Localizable", "SIGN_IN.WELCOME_BACK", fallback: "Welcome back! Sign in to access your courses.") }
  }
  public enum SignUp {
    /// By creating an account, you agree to the [%@ End User License Agreement](%@) and [%@ Terms of Service and Honor Code](%@) and you acknowledge that %@ and each Member process your personal data inaccordance with the [Privacy Policy.](%@)
    public static func agreement(_ p1: Any, _ p2: Any, _ p3: Any, _ p4: Any, _ p5: Any, _ p6: Any) -> String {
      return AuthLocalization.tr("Localizable", "SIGN_UP.AGREEMENT", String(describing: p1), String(describing: p2), String(describing: p3), String(describing: p4), String(describing: p5), String(describing: p6), fallback: "By creating an account, you agree to the [%@ End User License Agreement](%@) and [%@ Terms of Service and Honor Code](%@) and you acknowledge that %@ and each Member process your personal data inaccordance with the [Privacy Policy.](%@)")
    }
    /// Create account
    public static var createAccountBtn: String { return AuthLocalization.tr("Localizable", "SIGN_UP.CREATE_ACCOUNT_BTN", fallback: "Create account") }
    /// Hide optional Fields
    public static var hideFields: String { return AuthLocalization.tr("Localizable", "SIGN_UP.HIDE_FIELDS", fallback: "Hide optional Fields") }
    /// I agree that %@ may send me marketing messages.
    public static func marketingEmailTitle(_ p1: Any) -> String {
      return AuthLocalization.tr("Localizable", "SIGN_UP.MARKETING_EMAIL_TITLE", String(describing: p1), fallback: "I agree that %@ may send me marketing messages.")
    }
    /// Show optional Fields
    public static var showFields: String { return AuthLocalization.tr("Localizable", "SIGN_UP.SHOW_FIELDS", fallback: "Show optional Fields") }
    /// Create an account to start learning today!
    public static var subtitle: String { return AuthLocalization.tr("Localizable", "SIGN_UP.SUBTITLE", fallback: "Create an account to start learning today!") }
    /// You've successfully signed in.
    public static var successSigninLabel: String { return AuthLocalization.tr("Localizable", "SIGN_UP.SUCCESS_SIGNIN_LABEL", fallback: "You've successfully signed in.") }
    /// We just need a little more information before you start learning.
    public static var successSigninSublabel: String { return AuthLocalization.tr("Localizable", "SIGN_UP.SUCCESS_SIGNIN_SUBLABEL", fallback: "We just need a little more information before you start learning.") }
  }
  public enum Startup {
    /// Explore all courses
    public static var exploreAllCourses: String { return AuthLocalization.tr("Localizable", "STARTUP.EXPLORE_ALL_COURSES", fallback: "Explore all courses") }
    /// Buddhist studies, Tibetan language, and global skills made accessible anywhere.
    public static var infoMessage: String { return AuthLocalization.tr("Localizable", "STARTUP.INFO_MESSAGE", fallback: "Buddhist studies, Tibetan language, and global skills made accessible anywhere.") }
    /// Search our course catalog
    public static var searchPlaceholder: String { return AuthLocalization.tr("Localizable", "STARTUP.SEARCH_PLACEHOLDER", fallback: "Search our course catalog") }
    /// What do you want to learn?
    public static var searchTitle: String { return AuthLocalization.tr("Localizable", "STARTUP.SEARCH_TITLE", fallback: "What do you want to learn?") }
    /// Start
    public static var title: String { return AuthLocalization.tr("Localizable", "STARTUP.TITLE", fallback: "Start") }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension AuthLocalization {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
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
}
// swiftlint:enable convenience_type
