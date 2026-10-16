// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
public enum DiscussionLocalization {
  /// Anonymous
  public static var anonymous: String { return DiscussionLocalization.tr("Localizable", "ANONYMOUS", fallback: "Anonymous") }
  /// Plural format key: "%#@comments@"
  public static func commentsCount(_ p1: Int) -> String {
    return DiscussionLocalization.tr("Localizable", "comments_count", p1, fallback: "Plural format key: \"%#@comments@\"")
  }
  /// Plural format key: "%#@missed@"
  public static func missedPostsCount(_ p1: Int) -> String {
    return DiscussionLocalization.tr("Localizable", "missed_posts_count", p1, fallback: "Plural format key: \"%#@missed@\"")
  }
  /// Plural format key: "%#@responses@"
  public static func responsesCount(_ p1: Int) -> String {
    return DiscussionLocalization.tr("Localizable", "responses_count", p1, fallback: "Plural format key: \"%#@responses@\"")
  }
  /// Search
  public static var search: String { return DiscussionLocalization.tr("Localizable", "SEARCH", fallback: "Search") }
  /// Plural format key: "%#@topics@"
  public static func searchResultsDescription(_ p1: Int) -> String {
    return DiscussionLocalization.tr("Localizable", "searchResultsDescription", p1, fallback: "Plural format key: \"%#@topics@\"")
  }
  /// Localizable.strings
  ///   Discussion
  /// 
  ///   Created by  Stepanok Ivan on 12.10.2022.
  public static var title: String { return DiscussionLocalization.tr("Localizable", "TITLE", fallback: "Discussions") }
  /// Plural format key: "%#@votes@"
  public static func votesCount(_ p1: Int) -> String {
    return DiscussionLocalization.tr("Localizable", "votes_count", p1, fallback: "Plural format key: \"%#@votes@\"")
  }
  public enum Banner {
    /// Posting in discussions is disabled by the course team
    public static var discussionsIsDisabled: String { return DiscussionLocalization.tr("Localizable", "BANNER.DISCUSSIONS_IS_DISABLED", fallback: "Posting in discussions is disabled by the course team") }
  }
  public enum Comment {
    /// Follow
    public static var follow: String { return DiscussionLocalization.tr("Localizable", "COMMENT.FOLLOW", fallback: "Follow") }
    /// Report
    public static var report: String { return DiscussionLocalization.tr("Localizable", "COMMENT.REPORT", fallback: "Report") }
    /// Unfollow
    public static var unfollow: String { return DiscussionLocalization.tr("Localizable", "COMMENT.UNFOLLOW", fallback: "Unfollow") }
    /// Unreport
    public static var unreport: String { return DiscussionLocalization.tr("Localizable", "COMMENT.UNREPORT", fallback: "Unreport") }
  }
  public enum CreateThread {
    /// Create new discussion
    public static var createDiscussion: String { return DiscussionLocalization.tr("Localizable", "CREATE_THREAD.CREATE_DISCUSSION", fallback: "Create new discussion") }
    /// Create new question
    public static var createQuestion: String { return DiscussionLocalization.tr("Localizable", "CREATE_THREAD.CREATE_QUESTION", fallback: "Create new question") }
    /// Follow this discussion
    public static var followDiscussion: String { return DiscussionLocalization.tr("Localizable", "CREATE_THREAD.FOLLOW_DISCUSSION", fallback: "Follow this discussion") }
    /// Follow this question
    public static var followQuestion: String { return DiscussionLocalization.tr("Localizable", "CREATE_THREAD.FOLLOW_QUESTION", fallback: "Follow this question") }
    /// Create new post
    public static var newPost: String { return DiscussionLocalization.tr("Localizable", "CREATE_THREAD.NEW_POST", fallback: "Create new post") }
    /// Select post type
    public static var selectPostType: String { return DiscussionLocalization.tr("Localizable", "CREATE_THREAD.SELECT_POST_TYPE", fallback: "Select post type") }
    /// Title
    public static var title: String { return DiscussionLocalization.tr("Localizable", "CREATE_THREAD.TITLE", fallback: "Title") }
    /// Topic
    public static var topic: String { return DiscussionLocalization.tr("Localizable", "CREATE_THREAD.TOPIC", fallback: "Topic") }
  }
  public enum Error {
    /// Unable to load discussions.
    /// Try again later.
    public static var unableToLoadDiscussion: String { return DiscussionLocalization.tr("Localizable", "ERROR.UNABLE_TO_LOAD_DISCUSSION", fallback: "Unable to load discussions.\nTry again later.") }
  }
  public enum Post {
    /// Last post:
    public static var lastPost: String { return DiscussionLocalization.tr("Localizable", "POST.LAST_POST", fallback: "Last post:") }
  }
  public enum Posts {
    /// Create new post
    public static var createNewPost: String { return DiscussionLocalization.tr("Localizable", "POSTS.CREATE_NEW_POST", fallback: "Create new post") }
    public enum Alert {
      /// Make a selection
      public static var makeSelection: String { return DiscussionLocalization.tr("Localizable", "POSTS.ALERT.MAKE_SELECTION", fallback: "Make a selection") }
    }
    public enum Filter {
      /// All Posts
      public static var allPosts: String { return DiscussionLocalization.tr("Localizable", "POSTS.FILTER.ALL_POSTS", fallback: "All Posts") }
      /// Unanswered
      public static var unanswered: String { return DiscussionLocalization.tr("Localizable", "POSTS.FILTER.UNANSWERED", fallback: "Unanswered") }
      /// Unread
      public static var unread: String { return DiscussionLocalization.tr("Localizable", "POSTS.FILTER.UNREAD", fallback: "Unread") }
    }
    public enum NoDiscussion {
      /// Add a post
      public static var addPost: String { return DiscussionLocalization.tr("Localizable", "POSTS.NO_DISCUSSION.ADD_POST", fallback: "Add a post") }
      /// Create discussion
      public static var createbutton: String { return DiscussionLocalization.tr("Localizable", "POSTS.NO_DISCUSSION.CREATEBUTTON", fallback: "Create discussion") }
      /// Click the button below to create your first discussion.
      public static var description: String { return DiscussionLocalization.tr("Localizable", "POSTS.NO_DISCUSSION.DESCRIPTION", fallback: "Click the button below to create your first discussion.") }
      /// No discussions yet
      public static var title: String { return DiscussionLocalization.tr("Localizable", "POSTS.NO_DISCUSSION.TITLE", fallback: "No discussions yet") }
    }
    public enum Sort {
      /// Most Activity
      public static var mostActivity: String { return DiscussionLocalization.tr("Localizable", "POSTS.SORT.MOST_ACTIVITY", fallback: "Most Activity") }
      /// Most Votes
      public static var mostVotes: String { return DiscussionLocalization.tr("Localizable", "POSTS.SORT.MOST_VOTES", fallback: "Most Votes") }
      /// Recent Activity
      public static var recentActivity: String { return DiscussionLocalization.tr("Localizable", "POSTS.SORT.RECENT_ACTIVITY", fallback: "Recent Activity") }
    }
  }
  public enum PostType {
    /// discussion
    public static var discussion: String { return DiscussionLocalization.tr("Localizable", "POST_TYPE.DISCUSSION", fallback: "discussion") }
    /// question
    public static var question: String { return DiscussionLocalization.tr("Localizable", "POST_TYPE.QUESTION", fallback: "question") }
  }
  public enum Response {
    /// Add a comment
    public static var addComment: String { return DiscussionLocalization.tr("Localizable", "RESPONSE.ADD_COMMENT", fallback: "Add a comment") }
    /// Comment
    public static var commentsResponses: String { return DiscussionLocalization.tr("Localizable", "RESPONSE.COMMENTS_RESPONSES", fallback: "Comment") }
    public enum Alert {
      /// Comment added
      public static var commentAdded: String { return DiscussionLocalization.tr("Localizable", "RESPONSE.ALERT.COMMENT_ADDED", fallback: "Comment added") }
    }
  }
  public enum Search {
    /// Start typing to find the topics
    public static var emptyDescription: String { return DiscussionLocalization.tr("Localizable", "SEARCH.EMPTY_DESCRIPTION", fallback: "Start typing to find the topics") }
    /// Search results
    public static var title: String { return DiscussionLocalization.tr("Localizable", "SEARCH.TITLE", fallback: "Search results") }
  }
  public enum Thread {
    /// Add a response
    public static var addResponse: String { return DiscussionLocalization.tr("Localizable", "THREAD.ADD_RESPONSE", fallback: "Add a response") }
    public enum Alert {
      /// Comment added
      public static var commentAdded: String { return DiscussionLocalization.tr("Localizable", "THREAD.ALERT.COMMENT_ADDED", fallback: "Comment added") }
    }
  }
  public enum Topics {
    /// All Posts
    public static var allPosts: String { return DiscussionLocalization.tr("Localizable", "TOPICS.ALL_POSTS", fallback: "All Posts") }
    /// Main categories
    public static var mainCategories: String { return DiscussionLocalization.tr("Localizable", "TOPICS.MAIN_CATEGORIES", fallback: "Main categories") }
    /// Posts I'm following
    public static var postImFollowing: String { return DiscussionLocalization.tr("Localizable", "TOPICS.POST_IM_FOLLOWING", fallback: "Posts I'm following") }
    /// Search all posts
    public static var search: String { return DiscussionLocalization.tr("Localizable", "TOPICS.SEARCH", fallback: "Search all posts") }
    /// Unnamed subcategory
    public static var unnamed: String { return DiscussionLocalization.tr("Localizable", "TOPICS.UNNAMED", fallback: "Unnamed subcategory") }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension DiscussionLocalization {
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
