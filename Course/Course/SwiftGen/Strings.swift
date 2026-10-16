// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
public enum CourseLocalization {
  /// Plural format key: "%#@due_in@"
  public static func dueIn(_ p1: Int) -> String {
    return CourseLocalization.tr("Localizable", "due_in", p1, fallback: "Plural format key: \"%#@due_in@\"")
  }
  /// Plural format key: "%#@past_due@"
  public static func pastDue(_ p1: Int) -> String {
    return CourseLocalization.tr("Localizable", "past_due", p1, fallback: "Plural format key: \"%#@past_due@\"")
  }
  public enum Accessibility {
    /// %@ of %@ complete
    public static func assignmentCompletion(_ p1: Any, _ p2: Any) -> String {
      return CourseLocalization.tr("Localizable", "ACCESSIBILITY.ASSIGNMENT_COMPLETION", String(describing: p1), String(describing: p2), fallback: "%@ of %@ complete")
    }
    /// %@ of %@ complete. Weight: %@ percent of grade. Current grade: %@ out of %@ percent
    public static func assignmentFullDetails(_ p1: Any, _ p2: Any, _ p3: Any, _ p4: Any, _ p5: Any) -> String {
      return CourseLocalization.tr("Localizable", "ACCESSIBILITY.ASSIGNMENT_FULL_DETAILS", String(describing: p1), String(describing: p2), String(describing: p3), String(describing: p4), String(describing: p5), fallback: "%@ of %@ complete. Weight: %@ percent of grade. Current grade: %@ out of %@ percent")
    }
    /// Current grade: %@ out of %@ percent
    public static func assignmentGradeEarned(_ p1: Any, _ p2: Any) -> String {
      return CourseLocalization.tr("Localizable", "ACCESSIBILITY.ASSIGNMENT_GRADE_EARNED", String(describing: p1), String(describing: p2), fallback: "Current grade: %@ out of %@ percent")
    }
    /// Assignment item
    public static var assignmentItem: String { return CourseLocalization.tr("Localizable", "ACCESSIBILITY.ASSIGNMENT_ITEM", fallback: "Assignment item") }
    /// %@, %@ of %@ complete, %@ out of %@ percent of grade
    public static func assignmentProgressDetails(_ p1: Any, _ p2: Any, _ p3: Any, _ p4: Any, _ p5: Any) -> String {
      return CourseLocalization.tr("Localizable", "ACCESSIBILITY.ASSIGNMENT_PROGRESS_DETAILS", String(describing: p1), String(describing: p2), String(describing: p3), String(describing: p4), String(describing: p5), fallback: "%@, %@ of %@ complete, %@ out of %@ percent of grade")
    }
    /// Assignment progress section
    public static var assignmentProgressSection: String { return CourseLocalization.tr("Localizable", "ACCESSIBILITY.ASSIGNMENT_PROGRESS_SECTION", fallback: "Assignment progress section") }
    /// Assignment type column header
    public static var assignmentTypeHeader: String { return CourseLocalization.tr("Localizable", "ACCESSIBILITY.ASSIGNMENT_TYPE_HEADER", fallback: "Assignment type column header") }
    /// Assignments section
    public static var assignmentsSection: String { return CourseLocalization.tr("Localizable", "ACCESSIBILITY.ASSIGNMENTS_SECTION", fallback: "Assignments section") }
    /// Cancel download
    public static var cancelDownload: String { return CourseLocalization.tr("Localizable", "ACCESSIBILITY.CANCEL_DOWNLOAD", fallback: "Cancel download") }
    /// Continue learning section
    public static var continueLearningSection: String { return CourseLocalization.tr("Localizable", "ACCESSIBILITY.CONTINUE_LEARNING_SECTION", fallback: "Continue learning section") }
    /// Course content section
    public static var courseContentSection: String { return CourseLocalization.tr("Localizable", "ACCESSIBILITY.COURSE_CONTENT_SECTION", fallback: "Course content section") }
    /// Course progress section
    public static var courseProgressSection: String { return CourseLocalization.tr("Localizable", "ACCESSIBILITY.COURSE_PROGRESS_SECTION", fallback: "Course progress section") }
    /// Current grade: %@ percent
    public static func currentGrade(_ p1: Any) -> String {
      return CourseLocalization.tr("Localizable", "ACCESSIBILITY.CURRENT_GRADE", String(describing: p1), fallback: "Current grade: %@ percent")
    }
    /// Current and maximum percent column header
    public static var currentMaxPercentHeader: String { return CourseLocalization.tr("Localizable", "ACCESSIBILITY.CURRENT_MAX_PERCENT_HEADER", fallback: "Current and maximum percent column header") }
    /// Delete download
    public static var deleteDownload: String { return CourseLocalization.tr("Localizable", "ACCESSIBILITY.DELETE_DOWNLOAD", fallback: "Delete download") }
    /// Download
    public static var download: String { return CourseLocalization.tr("Localizable", "ACCESSIBILITY.DOWNLOAD", fallback: "Download") }
    /// Download section, %@
    public static func downloadSectionButton(_ p1: Any) -> String {
      return CourseLocalization.tr("Localizable", "ACCESSIBILITY.DOWNLOAD_SECTION_BUTTON", String(describing: p1), fallback: "Download section, %@")
    }
    /// Error message section
    public static var errorMessageSection: String { return CourseLocalization.tr("Localizable", "ACCESSIBILITY.ERROR_MESSAGE_SECTION", fallback: "Error message section") }
    /// Grade details section
    public static var gradeDetailsSection: String { return CourseLocalization.tr("Localizable", "ACCESSIBILITY.GRADE_DETAILS_SECTION", fallback: "Grade details section") }
    /// Grade requirement warning: %@ percent required to pass
    public static func gradeRequirementWarning(_ p1: Any) -> String {
      return CourseLocalization.tr("Localizable", "ACCESSIBILITY.GRADE_REQUIREMENT_WARNING", String(describing: p1), fallback: "Grade requirement warning: %@ percent required to pass")
    }
    /// Tap to hide completed sections
    public static var hideCompletedSections: String { return CourseLocalization.tr("Localizable", "ACCESSIBILITY.HIDE_COMPLETED_SECTIONS", fallback: "Tap to hide completed sections") }
    /// Loading section
    public static var loadingSection: String { return CourseLocalization.tr("Localizable", "ACCESSIBILITY.LOADING_SECTION", fallback: "Loading section") }
    /// No content available section
    public static var noContentSection: String { return CourseLocalization.tr("Localizable", "ACCESSIBILITY.NO_CONTENT_SECTION", fallback: "No content available section") }
    /// This course has no graded assignments to display
    public static var noGradedAssignmentsHint: String { return CourseLocalization.tr("Localizable", "ACCESSIBILITY.NO_GRADED_ASSIGNMENTS_HINT", fallback: "This course has no graded assignments to display") }
    /// Complete course activities to view your progress here
    public static var noProgressHint: String { return CourseLocalization.tr("Localizable", "ACCESSIBILITY.NO_PROGRESS_HINT", fallback: "Complete course activities to view your progress here") }
    /// Overall grade section
    public static var overallGradeSection: String { return CourseLocalization.tr("Localizable", "ACCESSIBILITY.OVERALL_GRADE_SECTION", fallback: "Overall grade section") }
    /// Overall progress: %@ percent
    public static func overallProgressValue(_ p1: Any) -> String {
      return CourseLocalization.tr("Localizable", "ACCESSIBILITY.OVERALL_PROGRESS_VALUE", String(describing: p1), fallback: "Overall progress: %@ percent")
    }
    /// Shows progress breakdown by assignment type
    public static var progressHint: String { return CourseLocalization.tr("Localizable", "ACCESSIBILITY.PROGRESS_HINT", fallback: "Shows progress breakdown by assignment type") }
    /// %@ percent completed
    public static func progressPercentageCompleted(_ p1: Any) -> String {
      return CourseLocalization.tr("Localizable", "ACCESSIBILITY.PROGRESS_PERCENTAGE_COMPLETED", String(describing: p1), fallback: "%@ percent completed")
    }
    /// Course completion progress ring
    public static var progressRing: String { return CourseLocalization.tr("Localizable", "ACCESSIBILITY.PROGRESS_RING", fallback: "Course completion progress ring") }
    /// Progress visualization showing %@ assignment categories
    public static func progressVisualization(_ p1: Any) -> String {
      return CourseLocalization.tr("Localizable", "ACCESSIBILITY.PROGRESS_VISUALIZATION", String(describing: p1), fallback: "Progress visualization showing %@ assignment categories")
    }
    /// Required grade to pass indicator
    public static var requiredGradeIndicator: String { return CourseLocalization.tr("Localizable", "ACCESSIBILITY.REQUIRED_GRADE_INDICATOR", fallback: "Required grade to pass indicator") }
    /// %@ percent required to pass
    public static func requiredGradeToPass(_ p1: Any) -> String {
      return CourseLocalization.tr("Localizable", "ACCESSIBILITY.REQUIRED_GRADE_TO_PASS", String(describing: p1), fallback: "%@ percent required to pass")
    }
    /// Tap to show completed sections
    public static var showCompletedSections: String { return CourseLocalization.tr("Localizable", "ACCESSIBILITY.SHOW_COMPLETED_SECTIONS", fallback: "Tap to show completed sections") }
    /// Video Navigation
    public static var videoNavigation: String { return CourseLocalization.tr("Localizable", "ACCESSIBILITY.VIDEO_NAVIGATION", fallback: "Video Navigation") }
    /// Video %@ from %@
    public static func videoNavigationCount(_ p1: Any, _ p2: Any) -> String {
      return CourseLocalization.tr("Localizable", "ACCESSIBILITY.VIDEO_NAVIGATION_COUNT", String(describing: p1), String(describing: p2), fallback: "Video %@ from %@")
    }
    /// %@ percent completed
    public static func videoPercentageCompleted(_ p1: Any) -> String {
      return CourseLocalization.tr("Localizable", "ACCESSIBILITY.VIDEO_PERCENTAGE_COMPLETED", String(describing: p1), fallback: "%@ percent completed")
    }
    /// Video progress %@ of %@ Completed.
    public static func videoProgressSection(_ p1: Any, _ p2: Any) -> String {
      return CourseLocalization.tr("Localizable", "ACCESSIBILITY.VIDEO_PROGRESS_SECTION", String(describing: p1), String(describing: p2), fallback: "Video progress %@ of %@ Completed.")
    }
    /// %@ section, %@ of %@ videos watched
    public static func videoSectionHeader(_ p1: Any, _ p2: Any, _ p3: Any) -> String {
      return CourseLocalization.tr("Localizable", "ACCESSIBILITY.VIDEO_SECTION_HEADER", String(describing: p1), String(describing: p2), String(describing: p3), fallback: "%@ section, %@ of %@ videos watched")
    }
    /// Video: %@
    public static func videoThumbnail(_ p1: Any) -> String {
      return CourseLocalization.tr("Localizable", "ACCESSIBILITY.VIDEO_THUMBNAIL", String(describing: p1), fallback: "Video: %@")
    }
    /// %@, completed
    public static func videoThumbnailCompleted(_ p1: Any) -> String {
      return CourseLocalization.tr("Localizable", "ACCESSIBILITY.VIDEO_THUMBNAIL_COMPLETED", String(describing: p1), fallback: "%@, completed")
    }
    /// Tap to play video
    public static var videoThumbnailHint: String { return CourseLocalization.tr("Localizable", "ACCESSIBILITY.VIDEO_THUMBNAIL_HINT", fallback: "Tap to play video") }
    /// %@, %@%% watched
    public static func videoThumbnailInProgress(_ p1: Any, _ p2: Any) -> String {
      return CourseLocalization.tr("Localizable", "ACCESSIBILITY.VIDEO_THUMBNAIL_IN_PROGRESS", String(describing: p1), String(describing: p2), fallback: "%@, %@%% watched")
    }
    /// %@, not started
    public static func videoThumbnailNotStarted(_ p1: Any) -> String {
      return CourseLocalization.tr("Localizable", "ACCESSIBILITY.VIDEO_THUMBNAIL_NOT_STARTED", String(describing: p1), fallback: "%@, not started")
    }
    /// Videos section
    public static var videosSection: String { return CourseLocalization.tr("Localizable", "ACCESSIBILITY.VIDEOS_SECTION", fallback: "Videos section") }
    /// Weight: %@ percent of grade
    public static func weightContribution(_ p1: Any) -> String {
      return CourseLocalization.tr("Localizable", "ACCESSIBILITY.WEIGHT_CONTRIBUTION", String(describing: p1), fallback: "Weight: %@ percent of grade")
    }
    public enum Carousel {
      /// %@ of %@ assignments completed
      public static func assignmentsCompleted(_ p1: Any, _ p2: Any) -> String {
        return CourseLocalization.tr("Localizable", "ACCESSIBILITY.CAROUSEL.ASSIGNMENTS_COMPLETED", String(describing: p1), String(describing: p2), fallback: "%@ of %@ assignments completed")
      }
      /// Last Page
      public static var lastSlideButton: String { return CourseLocalization.tr("Localizable", "ACCESSIBILITY.CAROUSEL.LAST_SLIDE_BUTTON", fallback: "Last Page") }
      /// Next Page
      public static var nextSlideButton: String { return CourseLocalization.tr("Localizable", "ACCESSIBILITY.CAROUSEL.NEXT_SLIDE_BUTTON", fallback: "Next Page") }
      /// Previous Page
      public static var previousSlideButton: String { return CourseLocalization.tr("Localizable", "ACCESSIBILITY.CAROUSEL.PREVIOUS_SLIDE_BUTTON", fallback: "Previous Page") }
    }
  }
  public enum Alert {
    /// Are you sure you want to delete all video(s) for
    public static var deleteAllVideos: String { return CourseLocalization.tr("Localizable", "ALERT.DELETE_ALL_VIDEOS", fallback: "Are you sure you want to delete all video(s) for") }
    /// Are you sure you want to delete video(s) for
    public static var deleteVideos: String { return CourseLocalization.tr("Localizable", "ALERT.DELETE_VIDEOS", fallback: "Are you sure you want to delete video(s) for") }
    /// Rotate your device to view this video in full screen.
    public static var rotateDevice: String { return CourseLocalization.tr("Localizable", "ALERT.ROTATE_DEVICE", fallback: "Rotate your device to view this video in full screen.") }
    /// Turning off the switch will stop downloading and delete all downloaded videos for
    public static var stopDownloading: String { return CourseLocalization.tr("Localizable", "ALERT.STOP_DOWNLOADING", fallback: "Turning off the switch will stop downloading and delete all downloaded videos for") }
    /// Warning
    public static var warning: String { return CourseLocalization.tr("Localizable", "ALERT.WARNING", fallback: "Warning") }
  }
  public enum Assignment {
    /// Review Course Grading Policy
    public static var reviewGradingPolicy: String { return CourseLocalization.tr("Localizable", "ASSIGNMENT.REVIEW_GRADING_POLICY", fallback: "Review Course Grading Policy") }
    /// Unknown
    public static var unknownSequence: String { return CourseLocalization.tr("Localizable", "ASSIGNMENT.UNKNOWN_SEQUENCE", fallback: "Unknown") }
  }
  public enum AssignmentStatus {
    /// %@ Complete - %@/%@ points
    public static func complete(_ p1: Any, _ p2: Any, _ p3: Any) -> String {
      return CourseLocalization.tr("Localizable", "ASSIGNMENT_STATUS.COMPLETE", String(describing: p1), String(describing: p2), String(describing: p3), fallback: "%@ Complete - %@/%@ points")
    }
    /// %@ %@
    public static func dueWithDate(_ p1: Any, _ p2: Any) -> String {
      return CourseLocalization.tr("Localizable", "ASSIGNMENT_STATUS.DUE_WITH_DATE", String(describing: p1), String(describing: p2), fallback: "%@ %@")
    }
    /// %@ - %@/%@ points
    public static func inProgress(_ p1: Any, _ p2: Any, _ p3: Any) -> String {
      return CourseLocalization.tr("Localizable", "ASSIGNMENT_STATUS.IN_PROGRESS", String(describing: p1), String(describing: p2), String(describing: p3), fallback: "%@ - %@/%@ points")
    }
    /// %@ Not Yet Available
    public static func notYetAvailable(_ p1: Any) -> String {
      return CourseLocalization.tr("Localizable", "ASSIGNMENT_STATUS.NOT_YET_AVAILABLE", String(describing: p1), fallback: "%@ Not Yet Available")
    }
    /// %@ Past Due - %@/%@ points
    public static func pastDue(_ p1: Any, _ p2: Any, _ p3: Any) -> String {
      return CourseLocalization.tr("Localizable", "ASSIGNMENT_STATUS.PAST_DUE", String(describing: p1), String(describing: p2), String(describing: p3), fallback: "%@ Past Due - %@/%@ points")
    }
  }
  public enum CalendarSyncStatus {
    /// Calendar Sync Failed
    public static var failed: String { return CourseLocalization.tr("Localizable", "CALENDAR_SYNC_STATUS.FAILED", fallback: "Calendar Sync Failed") }
    /// Offline
    public static var offline: String { return CourseLocalization.tr("Localizable", "CALENDAR_SYNC_STATUS.OFFLINE", fallback: "Offline") }
    /// Synced to Calendar
    public static var synced: String { return CourseLocalization.tr("Localizable", "CALENDAR_SYNC_STATUS.SYNCED", fallback: "Synced to Calendar") }
  }
  public enum Course {
    /// Completed
    public static var assignmentCompleted: String { return CourseLocalization.tr("Localizable", "COURSE.ASSIGNMENT_COMPLETED", fallback: "Completed") }
    /// Discussion
    public static var assignmentDiscussion: String { return CourseLocalization.tr("Localizable", "COURSE.ASSIGNMENT_DISCUSSION", fallback: "Discussion") }
    /// Drag and Drop
    public static var assignmentDragAndDrop: String { return CourseLocalization.tr("Localizable", "COURSE.ASSIGNMENT_DRAG_AND_DROP", fallback: "Drag and Drop") }
    /// Assignment
    public static var assignmentGeneric: String { return CourseLocalization.tr("Localizable", "COURSE.ASSIGNMENT_GENERIC", fallback: "Assignment") }
    /// Graded
    public static var assignmentGraded: String { return CourseLocalization.tr("Localizable", "COURSE.ASSIGNMENT_GRADED", fallback: "Graded") }
    /// In Progress
    public static var assignmentInProgress: String { return CourseLocalization.tr("Localizable", "COURSE.ASSIGNMENT_IN_PROGRESS", fallback: "In Progress") }
    /// External Tool
    public static var assignmentLti: String { return CourseLocalization.tr("Localizable", "COURSE.ASSIGNMENT_LTI", fallback: "External Tool") }
    /// Not Started
    public static var assignmentNotStarted: String { return CourseLocalization.tr("Localizable", "COURSE.ASSIGNMENT_NOT_STARTED", fallback: "Not Started") }
    /// Open Assessment
    public static var assignmentOpenAssessment: String { return CourseLocalization.tr("Localizable", "COURSE.ASSIGNMENT_OPEN_ASSESSMENT", fallback: "Open Assessment") }
    /// Peer Instruction
    public static var assignmentPeerInstruction: String { return CourseLocalization.tr("Localizable", "COURSE.ASSIGNMENT_PEER_INSTRUCTION", fallback: "Peer Instruction") }
    /// Problem
    public static var assignmentProblem: String { return CourseLocalization.tr("Localizable", "COURSE.ASSIGNMENT_PROBLEM", fallback: "Problem") }
    /// Survey
    public static var assignmentSurvey: String { return CourseLocalization.tr("Localizable", "COURSE.ASSIGNMENT_SURVEY", fallback: "Survey") }
    /// Word Cloud
    public static var assignmentWordCloud: String { return CourseLocalization.tr("Localizable", "COURSE.ASSIGNMENT_WORD_CLOUD", fallback: "Word Cloud") }
    /// Due Today
    public static var dueToday: String { return CourseLocalization.tr("Localizable", "COURSE.DUE_TODAY", fallback: "Due Today") }
    /// Due Tomorrow
    public static var dueTomorrow: String { return CourseLocalization.tr("Localizable", "COURSE.DUE_TOMORROW", fallback: "Due Tomorrow") }
    /// %@/%@ Completed
    public static func progressCompleted(_ p1: Any, _ p2: Any) -> String {
      return CourseLocalization.tr("Localizable", "COURSE.PROGRESS_COMPLETED", String(describing: p1), String(describing: p2), fallback: "%@/%@ Completed")
    }
    /// Hide Completed
    public static var progressHideCompleted: String { return CourseLocalization.tr("Localizable", "COURSE.PROGRESS_HIDE_COMPLETED", fallback: "Hide Completed") }
    /// %@/%@ Completed
    public static func progressVideosCompleted(_ p1: Any, _ p2: Any) -> String {
      return CourseLocalization.tr("Localizable", "COURSE.PROGRESS_VIDEOS_COMPLETED", String(describing: p1), String(describing: p2), fallback: "%@/%@ Completed")
    }
    /// View Completed
    public static var progressViewCompleted: String { return CourseLocalization.tr("Localizable", "COURSE.PROGRESS_VIEW_COMPLETED", fallback: "View Completed") }
    /// %@/%@ Watched
    public static func progressWatched(_ p1: Any, _ p2: Any) -> String {
      return CourseLocalization.tr("Localizable", "COURSE.PROGRESS_WATCHED", String(describing: p1), String(describing: p2), fallback: "%@/%@ Watched")
    }
    /// Return to Course Home
    public static var returnToHome: String { return CourseLocalization.tr("Localizable", "COURSE.RETURN_TO_HOME", fallback: "Return to Course Home") }
    public enum LargestDownloads {
      /// Done
      public static var done: String { return CourseLocalization.tr("Localizable", "COURSE.LARGEST_DOWNLOADS.DONE", fallback: "Done") }
      /// Edit
      public static var edit: String { return CourseLocalization.tr("Localizable", "COURSE.LARGEST_DOWNLOADS.EDIT", fallback: "Edit") }
      /// Remove all downloads
      public static var removeDownloads: String { return CourseLocalization.tr("Localizable", "COURSE.LARGEST_DOWNLOADS.REMOVE_DOWNLOADS", fallback: "Remove all downloads") }
      /// Largest Downloads
      public static var title: String { return CourseLocalization.tr("Localizable", "COURSE.LARGEST_DOWNLOADS.TITLE", fallback: "Largest Downloads") }
    }
    public enum Offline {
      /// %@%% of this course can be completed offline.
      public static func canBeCompleted(_ p1: Any) -> String {
        return CourseLocalization.tr("Localizable", "COURSE.OFFLINE.CAN_BE_COMPLETED", String(describing: p1), fallback: "%@%% of this course can be completed offline.")
      }
      /// Cancel Course Download
      public static var cancelCourseDownload: String { return CourseLocalization.tr("Localizable", "COURSE.OFFLINE.CANCEL_COURSE_DOWNLOAD", fallback: "Cancel Course Download") }
      /// Download all
      public static var downloadAll: String { return CourseLocalization.tr("Localizable", "COURSE.OFFLINE.DOWNLOAD_ALL", fallback: "Download all") }
      /// %@%% of this course is downloadable.
      public static func downloadable(_ p1: Any) -> String {
        return CourseLocalization.tr("Localizable", "COURSE.OFFLINE.DOWNLOADABLE", String(describing: p1), fallback: "%@%% of this course is downloadable.")
      }
      /// %@%% of this course is visible on mobile.
      public static func visible(_ p1: Any) -> String {
        return CourseLocalization.tr("Localizable", "COURSE.OFFLINE.VISIBLE", String(describing: p1), fallback: "%@%% of this course is visible on mobile.")
      }
      /// You can download course content offline to learn on the go, without requiring an active internet connection or using mobile data.
      public static var youCanDownload: String { return CourseLocalization.tr("Localizable", "COURSE.OFFLINE.YOU_CAN_DOWNLOAD", fallback: "You can download course content offline to learn on the go, without requiring an active internet connection or using mobile data.") }
      /// None of this course's content is currently available to download offline.
      public static var youCantDownload: String { return CourseLocalization.tr("Localizable", "COURSE.OFFLINE.YOU_CANT_DOWNLOAD", fallback: "None of this course's content is currently available to download offline.") }
    }
    public enum TotalProgress {
      /// Available to Download
      public static var avaliableToDownload: String { return CourseLocalization.tr("Localizable", "COURSE.TOTAL_PROGRESS.AVALIABLE_TO_DOWNLOAD", fallback: "Available to Download") }
      /// Downloaded
      public static var downloaded: String { return CourseLocalization.tr("Localizable", "COURSE.TOTAL_PROGRESS.DOWNLOADED", fallback: "Downloaded") }
      /// Downloading
      public static var downloading: String { return CourseLocalization.tr("Localizable", "COURSE.TOTAL_PROGRESS.DOWNLOADING", fallback: "Downloading") }
      /// Ready to Download
      public static var readyToDownload: String { return CourseLocalization.tr("Localizable", "COURSE.TOTAL_PROGRESS.READY_TO_DOWNLOAD", fallback: "Ready to Download") }
    }
  }
  public enum Courseware {
    /// Back to outline
    public static var backToOutline: String { return CourseLocalization.tr("Localizable", "COURSEWARE.BACK_TO_OUTLINE", fallback: "Back to outline") }
    /// %@ of %@
    public static func blockPosition(_ p1: Any, _ p2: Any) -> String {
      return CourseLocalization.tr("Localizable", "COURSEWARE.BLOCK_POSITION", String(describing: p1), String(describing: p2), fallback: "%@ of %@")
    }
    /// Continue
    public static var `continue`: String { return CourseLocalization.tr("Localizable", "COURSEWARE.CONTINUE", fallback: "Continue") }
    /// Course content
    public static var courseContent: String { return CourseLocalization.tr("Localizable", "COURSEWARE.COURSE_CONTENT", fallback: "Course content") }
    /// Course units
    public static var courseUnits: String { return CourseLocalization.tr("Localizable", "COURSEWARE.COURSE_UNITS", fallback: "Course units") }
    /// Finish
    public static var finish: String { return CourseLocalization.tr("Localizable", "COURSEWARE.FINISH", fallback: "Finish") }
    /// Good job!
    public static var goodWork: String { return CourseLocalization.tr("Localizable", "COURSEWARE.GOOD_WORK", fallback: "Good job!") }
    /// “.
    public static var isFinished: String { return CourseLocalization.tr("Localizable", "COURSEWARE.IS_FINISHED", fallback: "“.") }
    /// Next
    public static var next: String { return CourseLocalization.tr("Localizable", "COURSEWARE.NEXT", fallback: "Next") }
    /// Prev
    public static var previous: String { return CourseLocalization.tr("Localizable", "COURSEWARE.PREVIOUS", fallback: "Prev") }
    /// Previous
    public static var previousFull: String { return CourseLocalization.tr("Localizable", "COURSEWARE.PREVIOUS_FULL", fallback: "Previous") }
    /// Resume with:
    public static var resumeWith: String { return CourseLocalization.tr("Localizable", "COURSEWARE.RESUME_WITH", fallback: "Resume with:") }
    /// You've completed “
    public static var section: String { return CourseLocalization.tr("Localizable", "COURSEWARE.SECTION", fallback: "You've completed “") }
  }
  public enum CourseCarousel {
    /// You’re all caught up on assignments!
    public static var allAssignmentsCompleted: String { return CourseLocalization.tr("Localizable", "COURSE_CAROUSEL.ALL_ASSIGNMENTS_COMPLETED", fallback: "You’re all caught up on assignments!") }
    /// All Content
    public static var allContent: String { return CourseLocalization.tr("Localizable", "COURSE_CAROUSEL.ALL_CONTENT", fallback: "All Content") }
    /// You’re all caught up on videos!
    public static var allVideosCompleted: String { return CourseLocalization.tr("Localizable", "COURSE_CAROUSEL.ALL_VIDEOS_COMPLETED", fallback: "You’re all caught up on videos!") }
    /// Assignments
    /// completed
    public static var assigmentsCompleted: String { return CourseLocalization.tr("Localizable", "COURSE_CAROUSEL.ASSIGMENTS_COMPLETED", fallback: "Assignments\ncompleted") }
    /// Continue Watching
    public static var continueWatching: String { return CourseLocalization.tr("Localizable", "COURSE_CAROUSEL.CONTINUE_WATCHING", fallback: "Continue Watching") }
    /// Grades
    public static var grades: String { return CourseLocalization.tr("Localizable", "COURSE_CAROUSEL.GRADES", fallback: "Grades") }
    /// This represents your weighted grade against the grade needed to pass this course.
    public static var gradesDescription: String { return CourseLocalization.tr("Localizable", "COURSE_CAROUSEL.GRADES_DESCRIPTION", fallback: "This represents your weighted grade against the grade needed to pass this course.") }
    /// Next Assignment
    public static var nextAssignments: String { return CourseLocalization.tr("Localizable", "COURSE_CAROUSEL.NEXT_ASSIGNMENTS", fallback: "Next Assignment") }
    /// Next Video
    public static var nextVideo: String { return CourseLocalization.tr("Localizable", "COURSE_CAROUSEL.NEXT_VIDEO", fallback: "Next Video") }
    /// You have completed %@%% of the course progress
    public static func progressCompletion(_ p1: Any) -> String {
      return CourseLocalization.tr("Localizable", "COURSE_CAROUSEL.PROGRESS_COMPLETION", String(describing: p1), fallback: "You have completed %@%% of the course progress")
    }
    /// You’re auditing this course now and have limited access to course material.
    public static var upgradeNowBody: String { return CourseLocalization.tr("Localizable", "COURSE_CAROUSEL.UPGRADE_NOW_BODY", fallback: "You’re auditing this course now and have limited access to course material.") }
    /// Upgrade now
    public static var upgradeNowButton: String { return CourseLocalization.tr("Localizable", "COURSE_CAROUSEL.UPGRADE_NOW_BUTTON", fallback: "Upgrade now") }
    /// Videos
    /// completed
    public static var videosCompleted: String { return CourseLocalization.tr("Localizable", "COURSE_CAROUSEL.VIDEOS_COMPLETED", fallback: "Videos\ncompleted") }
    /// All Assignments
    public static var viewAllAssignments: String { return CourseLocalization.tr("Localizable", "COURSE_CAROUSEL.VIEW_ALL_ASSIGNMENTS", fallback: "All Assignments") }
    /// All Videos
    public static var viewAllVideos: String { return CourseLocalization.tr("Localizable", "COURSE_CAROUSEL.VIEW_ALL_VIDEOS", fallback: "All Videos") }
  }
  public enum CourseContainer {
    /// Content
    public static var content: String { return CourseLocalization.tr("Localizable", "COURSE_CONTAINER.CONTENT", fallback: "Content") }
    /// Dates
    public static var dates: String { return CourseLocalization.tr("Localizable", "COURSE_CONTAINER.DATES", fallback: "Dates") }
    /// Discussions
    public static var discussions: String { return CourseLocalization.tr("Localizable", "COURSE_CONTAINER.DISCUSSIONS", fallback: "Discussions") }
    /// More
    public static var handouts: String { return CourseLocalization.tr("Localizable", "COURSE_CONTAINER.HANDOUTS", fallback: "More") }
    /// Handouts In developing
    public static var handoutsInDeveloping: String { return CourseLocalization.tr("Localizable", "COURSE_CONTAINER.HANDOUTS_IN_DEVELOPING", fallback: "Handouts In developing") }
    /// Home
    public static var home: String { return CourseLocalization.tr("Localizable", "COURSE_CONTAINER.HOME", fallback: "Home") }
    /// Offline
    public static var offline: String { return CourseLocalization.tr("Localizable", "COURSE_CONTAINER.OFFLINE", fallback: "Offline") }
    /// Progress
    public static var progress: String { return CourseLocalization.tr("Localizable", "COURSE_CONTAINER.PROGRESS", fallback: "Progress") }
    /// Videos
    public static var videos: String { return CourseLocalization.tr("Localizable", "COURSE_CONTAINER.VIDEOS", fallback: "Videos") }
    public enum Progress {
      /// Assignment Type
      public static var assignmentType: String { return CourseLocalization.tr("Localizable", "COURSE_CONTAINER.PROGRESS.ASSIGNMENT_TYPE", fallback: "Assignment Type") }
      /// Complete
      public static var complete: String { return CourseLocalization.tr("Localizable", "COURSE_CONTAINER.PROGRESS.COMPLETE", fallback: "Complete") }
      /// Completed
      public static var completed: String { return CourseLocalization.tr("Localizable", "COURSE_CONTAINER.PROGRESS.COMPLETED", fallback: "Completed") }
      /// Current / Max %%
      public static var currentMaxPercent: String { return CourseLocalization.tr("Localizable", "COURSE_CONTAINER.PROGRESS.CURRENT_MAX_PERCENT", fallback: "Current / Max %%") }
      /// Current Overall Weighted Grade:
      public static var currentOverallWeightedGrade: String { return CourseLocalization.tr("Localizable", "COURSE_CONTAINER.PROGRESS.CURRENT_OVERALL_WEIGHTED_GRADE", fallback: "Current Overall Weighted Grade:") }
      /// This represents how much of the course content you have completed. Note that some content may not yet be released.
      public static var description: String { return CourseLocalization.tr("Localizable", "COURSE_CONTAINER.PROGRESS.DESCRIPTION", fallback: "This represents how much of the course content you have completed. Note that some content may not yet be released.") }
      /// Grade Details
      public static var gradeDetails: String { return CourseLocalization.tr("Localizable", "COURSE_CONTAINER.PROGRESS.GRADE_DETAILS", fallback: "Grade Details") }
      /// Grade Progress
      public static var gradeProgress: String { return CourseLocalization.tr("Localizable", "COURSE_CONTAINER.PROGRESS.GRADE_PROGRESS", fallback: "Grade Progress") }
      /// Locked
      public static var locked: String { return CourseLocalization.tr("Localizable", "COURSE_CONTAINER.PROGRESS.LOCKED", fallback: "Locked") }
      /// This course does not contain graded assignments.
      public static var noGradedAssignments: String { return CourseLocalization.tr("Localizable", "COURSE_CONTAINER.PROGRESS.NO_GRADED_ASSIGNMENTS", fallback: "This course does not contain graded assignments.") }
      /// No progress available
      public static var noProgressAvailable: String { return CourseLocalization.tr("Localizable", "COURSE_CONTAINER.PROGRESS.NO_PROGRESS_AVAILABLE", fallback: "No progress available") }
      /// Not Passing
      public static var notPassing: String { return CourseLocalization.tr("Localizable", "COURSE_CONTAINER.PROGRESS.NOT_PASSING", fallback: "Not Passing") }
      /// of Grade
      public static var ofGrade: String { return CourseLocalization.tr("Localizable", "COURSE_CONTAINER.PROGRESS.OF_GRADE", fallback: "of Grade") }
      /// Overall Grade
      public static var overallGrade: String { return CourseLocalization.tr("Localizable", "COURSE_CONTAINER.PROGRESS.OVERALL_GRADE", fallback: "Overall Grade") }
      /// This represents your weighted grade against the grade needed to pass this course.
      public static var overallGradeDescription: String { return CourseLocalization.tr("Localizable", "COURSE_CONTAINER.PROGRESS.OVERALL_GRADE_DESCRIPTION", fallback: "This represents your weighted grade against the grade needed to pass this course.") }
      /// Overall Progress
      public static var overallProgress: String { return CourseLocalization.tr("Localizable", "COURSE_CONTAINER.PROGRESS.OVERALL_PROGRESS", fallback: "Overall Progress") }
      /// Passing
      public static var passing: String { return CourseLocalization.tr("Localizable", "COURSE_CONTAINER.PROGRESS.PASSING", fallback: "Passing") }
      /// Remaining
      public static var remaining: String { return CourseLocalization.tr("Localizable", "COURSE_CONTAINER.PROGRESS.REMAINING", fallback: "Remaining") }
      /// Required
      public static var `required`: String { return CourseLocalization.tr("Localizable", "COURSE_CONTAINER.PROGRESS.REQUIRED", fallback: "Required") }
      /// Sections Progress
      public static var sectionsProgress: String { return CourseLocalization.tr("Localizable", "COURSE_CONTAINER.PROGRESS.SECTIONS_PROGRESS", fallback: "Sections Progress") }
      /// Start learning to see your progress here
      public static var startLearning: String { return CourseLocalization.tr("Localizable", "COURSE_CONTAINER.PROGRESS.START_LEARNING", fallback: "Start learning to see your progress here") }
      /// Course Completion
      public static var title: String { return CourseLocalization.tr("Localizable", "COURSE_CONTAINER.PROGRESS.TITLE", fallback: "Course Completion") }
      /// View Certificate
      public static var viewCertificate: String { return CourseLocalization.tr("Localizable", "COURSE_CONTAINER.PROGRESS.VIEW_CERTIFICATE", fallback: "View Certificate") }
      /// A weighted grade of %@%% is required to pass this course
      public static func weightedGradeRequired(_ p1: Any) -> String {
        return CourseLocalization.tr("Localizable", "COURSE_CONTAINER.PROGRESS.WEIGHTED_GRADE_REQUIRED", String(describing: p1), fallback: "A weighted grade of %@%% is required to pass this course")
      }
    }
  }
  public enum CourseContent {
    /// All
    public static var all: String { return CourseLocalization.tr("Localizable", "COURSE_CONTENT.ALL", fallback: "All") }
    /// Assignments
    public static var assignments: String { return CourseLocalization.tr("Localizable", "COURSE_CONTENT.ASSIGNMENTS", fallback: "Assignments") }
    /// Videos
    public static var videos: String { return CourseLocalization.tr("Localizable", "COURSE_CONTENT.VIDEOS", fallback: "Videos") }
  }
  public enum CourseDates {
    /// Would you like to add the %@ calendar "%@" ? 
    ///  You can edit or remove the course calendar any time in Calendar or Settings
    public static func addCalendarPrompt(_ p1: Any, _ p2: Any) -> String {
      return CourseLocalization.tr("Localizable", "COURSE_DATES.ADD_CALENDAR_PROMPT", String(describing: p1), String(describing: p2), fallback: "Would you like to add the %@ calendar \"%@\" ? \n You can edit or remove the course calendar any time in Calendar or Settings")
    }
    /// Add calendar
    public static var addCalendarTitle: String { return CourseLocalization.tr("Localizable", "COURSE_DATES.ADD_CALENDAR_TITLE", fallback: "Add calendar") }
    /// Calendar events
    public static var calendarEvents: String { return CourseLocalization.tr("Localizable", "COURSE_DATES.CALENDAR_EVENTS", fallback: "Calendar events") }
    /// Your course calendar has been added.
    public static var calendarEventsAdded: String { return CourseLocalization.tr("Localizable", "COURSE_DATES.CALENDAR_EVENTS_ADDED", fallback: "Your course calendar has been added.") }
    /// Your course calendar has been removed.
    public static var calendarEventsRemoved: String { return CourseLocalization.tr("Localizable", "COURSE_DATES.CALENDAR_EVENTS_REMOVED", fallback: "Your course calendar has been removed.") }
    /// Your course calendar has been updated.
    public static var calendarEventsUpdated: String { return CourseLocalization.tr("Localizable", "COURSE_DATES.CALENDAR_EVENTS_UPDATED", fallback: "Your course calendar has been updated.") }
    /// Your course calendar is out of date
    public static var calendarOutOfDate: String { return CourseLocalization.tr("Localizable", "COURSE_DATES.CALENDAR_OUT_OF_DATE", fallback: "Your course calendar is out of date") }
    /// %@ does not have calendar permission. Please go to settings and give calender permission.
    public static func calendarPermissionNotDetermined(_ p1: Any) -> String {
      return CourseLocalization.tr("Localizable", "COURSE_DATES.CALENDAR_PERMISSION_NOT_DETERMINED", String(describing: p1), fallback: "%@ does not have calendar permission. Please go to settings and give calender permission.")
    }
    /// Your course dates have been shifted and your course calendar is no longer up to date with your new schedule.
    public static var calendarShiftMessage: String { return CourseLocalization.tr("Localizable", "COURSE_DATES.CALENDAR_SHIFT_MESSAGE", fallback: "Your course dates have been shifted and your course calendar is no longer up to date with your new schedule.") }
    /// Update now
    public static var calendarShiftPromptUpdateNow: String { return CourseLocalization.tr("Localizable", "COURSE_DATES.CALENDAR_SHIFT_PROMPT_UPDATE_NOW", fallback: "Update now") }
    /// Syncing calendar...
    public static var calendarSyncMessage: String { return CourseLocalization.tr("Localizable", "COURSE_DATES.CALENDAR_SYNC_MESSAGE", fallback: "Syncing calendar...") }
    /// View Events
    public static var calendarViewEvents: String { return CourseLocalization.tr("Localizable", "COURSE_DATES.CALENDAR_VIEW_EVENTS", fallback: "View Events") }
    /// Completed
    public static var completed: String { return CourseLocalization.tr("Localizable", "COURSE_DATES.COMPLETED", fallback: "Completed") }
    /// "%@" has been added to your calendar.
    public static func datesAddedAlertMessage(_ p1: Any) -> String {
      return CourseLocalization.tr("Localizable", "COURSE_DATES.DATES_ADDED_ALERT_MESSAGE", String(describing: p1), fallback: "\"%@\" has been added to your calendar.")
    }
    /// Due next
    public static var dueNext: String { return CourseLocalization.tr("Localizable", "COURSE_DATES.DUE_NEXT", fallback: "Due next") }
    /// Item Hidden
    public static var itemHidden: String { return CourseLocalization.tr("Localizable", "COURSE_DATES.ITEM_HIDDEN", fallback: "Item Hidden") }
    /// Items Hidden
    public static var itemsHidden: String { return CourseLocalization.tr("Localizable", "COURSE_DATES.ITEMS_HIDDEN", fallback: "Items Hidden") }
    /// Open Settings
    public static var openSettings: String { return CourseLocalization.tr("Localizable", "COURSE_DATES.OPEN_SETTINGS", fallback: "Open Settings") }
    /// Past due
    public static var pastDue: String { return CourseLocalization.tr("Localizable", "COURSE_DATES.PAST_DUE", fallback: "Past due") }
    /// Would you like to remove the %@ calendar "%@" ?
    public static func removeCalendarPrompt(_ p1: Any, _ p2: Any) -> String {
      return CourseLocalization.tr("Localizable", "COURSE_DATES.REMOVE_CALENDAR_PROMPT", String(describing: p1), String(describing: p2), fallback: "Would you like to remove the %@ calendar \"%@\" ?")
    }
    /// Remove calendar
    public static var removeCalendarTitle: String { return CourseLocalization.tr("Localizable", "COURSE_DATES.REMOVE_CALENDAR_TITLE", fallback: "Remove calendar") }
    /// Content available from %@
    public static func sessionContentAvailableFrom(_ p1: Any) -> String {
      return CourseLocalization.tr("Localizable", "COURSE_DATES.SESSION_CONTENT_AVAILABLE_FROM", String(describing: p1), fallback: "Content available from %@")
    }
    /// Instructor: %@
    public static func sessionInstructor(_ p1: Any) -> String {
      return CourseLocalization.tr("Localizable", "COURSE_DATES.SESSION_INSTRUCTOR", String(describing: p1), fallback: "Instructor: %@")
    }
    /// Tools required: %@
    public static func sessionToolsRequired(_ p1: Any) -> String {
      return CourseLocalization.tr("Localizable", "COURSE_DATES.SESSION_TOOLS_REQUIRED", String(describing: p1), fallback: "Tools required: %@")
    }
    /// Settings
    public static var settings: String { return CourseLocalization.tr("Localizable", "COURSE_DATES.SETTINGS", fallback: "Settings") }
    /// Sync to calendar
    public static var syncToCalendar: String { return CourseLocalization.tr("Localizable", "COURSE_DATES.SYNC_TO_CALENDAR", fallback: "Sync to calendar") }
    /// Automatically sync all deadlines and due dates for this course to your calendar.
    public static var syncToCalendarMessage: String { return CourseLocalization.tr("Localizable", "COURSE_DATES.SYNC_TO_CALENDAR_MESSAGE", fallback: "Automatically sync all deadlines and due dates for this course to your calendar.") }
    /// Your due dates have been successfully shifted to help you stay on track.
    public static var toastSuccessMessage: String { return CourseLocalization.tr("Localizable", "COURSE_DATES.TOAST_SUCCESS_MESSAGE", fallback: "Your due dates have been successfully shifted to help you stay on track.") }
    /// Due dates shifted
    public static var toastSuccessTitle: String { return CourseLocalization.tr("Localizable", "COURSE_DATES.TOAST_SUCCESS_TITLE", fallback: "Due dates shifted") }
    /// Today
    public static var today: String { return CourseLocalization.tr("Localizable", "COURSE_DATES.TODAY", fallback: "Today") }
    /// Unreleased
    public static var unreleased: String { return CourseLocalization.tr("Localizable", "COURSE_DATES.UNRELEASED", fallback: "Unreleased") }
    /// Verified Only
    public static var verifiedOnly: String { return CourseLocalization.tr("Localizable", "COURSE_DATES.VERIFIED_ONLY", fallback: "Verified Only") }
    /// View all dates
    public static var viewAllDates: String { return CourseLocalization.tr("Localizable", "COURSE_DATES.VIEW_ALL_DATES", fallback: "View all dates") }
    public enum ResetDate {
      /// Your dates could not be shifted. Please try again.
      public static var errorMessage: String { return CourseLocalization.tr("Localizable", "COURSE_DATES.RESET_DATE.ERROR_MESSAGE", fallback: "Your dates could not be shifted. Please try again.") }
      /// Your dates have been successfully shifted.
      public static var successMessage: String { return CourseLocalization.tr("Localizable", "COURSE_DATES.RESET_DATE.SUCCESS_MESSAGE", fallback: "Your dates have been successfully shifted.") }
      /// Course Dates
      public static var title: String { return CourseLocalization.tr("Localizable", "COURSE_DATES.RESET_DATE.TITLE", fallback: "Course Dates") }
    }
  }
  public enum Download {
    /// All videos downloaded
    public static var allVideosDownloaded: String { return CourseLocalization.tr("Localizable", "DOWNLOAD.ALL_VIDEOS_DOWNLOADED", fallback: "All videos downloaded") }
    /// You cannot change the download video quality when all videos are downloading
    public static var changeQualityAlert: String { return CourseLocalization.tr("Localizable", "DOWNLOAD.CHANGE_QUALITY_ALERT", fallback: "You cannot change the download video quality when all videos are downloading") }
    /// Download to device
    public static var downloadToDevice: String { return CourseLocalization.tr("Localizable", "DOWNLOAD.DOWNLOAD_TO_DEVICE", fallback: "Download to device") }
    /// Downloading videos...
    public static var downloadingVideos: String { return CourseLocalization.tr("Localizable", "DOWNLOAD.DOWNLOADING_VIDEOS", fallback: "Downloading videos...") }
    /// Downloads
    public static var downloads: String { return CourseLocalization.tr("Localizable", "DOWNLOAD.DOWNLOADS", fallback: "Downloads") }
    /// Your current download settings only allow downloads over Wi-Fi.
    /// Please connect to a Wi-Fi network or change your download settings.
    public static var noWifiMessage: String { return CourseLocalization.tr("Localizable", "DOWNLOAD.NO_WIFI_MESSAGE", fallback: "Your current download settings only allow downloads over Wi-Fi.\nPlease connect to a Wi-Fi network or change your download settings.") }
    /// Remaining
    public static var remaining: String { return CourseLocalization.tr("Localizable", "DOWNLOAD.REMAINING", fallback: "Remaining") }
    /// Total
    public static var total: String { return CourseLocalization.tr("Localizable", "DOWNLOAD.TOTAL", fallback: "Total") }
    /// Untitled
    public static var untitled: String { return CourseLocalization.tr("Localizable", "DOWNLOAD.UNTITLED", fallback: "Untitled") }
    /// Videos
    public static var videos: String { return CourseLocalization.tr("Localizable", "DOWNLOAD.VIDEOS", fallback: "Videos") }
  }
  public enum Error {
    /// There are currently no announcements for this course.
    public static var announcementsUnavailable: String { return CourseLocalization.tr("Localizable", "ERROR.ANNOUNCEMENTS_UNAVAILABLE", fallback: "There are currently no announcements for this course.") }
    /// No assignments available for this course.
    public static var assignmentsUnavailable: String { return CourseLocalization.tr("Localizable", "ERROR.ASSIGNMENTS_UNAVAILABLE", fallback: "No assignments available for this course.") }
    /// Course component not found, please reload
    public static var componentNotFount: String { return CourseLocalization.tr("Localizable", "ERROR.COMPONENT_NOT_FOUNT", fallback: "Course component not found, please reload") }
    /// Course dates are not currently available.
    public static var courseDateUnavailable: String { return CourseLocalization.tr("Localizable", "ERROR.COURSE_DATE_UNAVAILABLE", fallback: "Course dates are not currently available.") }
    /// No course content is currently available.
    public static var coursewareUnavailable: String { return CourseLocalization.tr("Localizable", "ERROR.COURSEWARE_UNAVAILABLE", fallback: "No course content is currently available.") }
    /// There are currently no handouts for this course.
    public static var handoutsUnavailable: String { return CourseLocalization.tr("Localizable", "ERROR.HANDOUTS_UNAVAILABLE", fallback: "There are currently no handouts for this course.") }
    /// You are not connected to the Internet. Please check your Internet connection.
    public static var noInternet: String { return CourseLocalization.tr("Localizable", "ERROR.NO_INTERNET", fallback: "You are not connected to the Internet. Please check your Internet connection.") }
    /// Reload
    public static var reload: String { return CourseLocalization.tr("Localizable", "ERROR.RELOAD", fallback: "Reload") }
    /// No videos available for this course.
    public static var videosUnavailable: String { return CourseLocalization.tr("Localizable", "ERROR.VIDEOS_UNAVAILABLE", fallback: "No videos available for this course.") }
  }
  public enum HandoutsCellAnnouncements {
    /// Keep up with the latest news
    public static var description: String { return CourseLocalization.tr("Localizable", "HANDOUTS_CELL_ANNOUNCEMENTS.DESCRIPTION", fallback: "Keep up with the latest news") }
    /// Announcements
    public static var title: String { return CourseLocalization.tr("Localizable", "HANDOUTS_CELL_ANNOUNCEMENTS.TITLE", fallback: "Announcements") }
  }
  public enum HandoutsCellHandouts {
    /// Find important course information
    public static var description: String { return CourseLocalization.tr("Localizable", "HANDOUTS_CELL_HANDOUTS.DESCRIPTION", fallback: "Find important course information") }
    /// Handouts
    public static var title: String { return CourseLocalization.tr("Localizable", "HANDOUTS_CELL_HANDOUTS.TITLE", fallback: "Handouts") }
  }
  public enum LockedContent {
    /// You must complete "%@" before accessing this section.
    public static func description(_ p1: Any) -> String {
      return CourseLocalization.tr("Localizable", "LOCKED_CONTENT.DESCRIPTION", String(describing: p1), fallback: "You must complete \"%@\" before accessing this section.")
    }
    /// Go To Prerequisite Section
    public static var goToPrerequisite: String { return CourseLocalization.tr("Localizable", "LOCKED_CONTENT.GO_TO_PREREQUISITE", fallback: "Go To Prerequisite Section") }
    /// Content Locked
    public static var title: String { return CourseLocalization.tr("Localizable", "LOCKED_CONTENT.TITLE", fallback: "Content Locked") }
  }
  public enum NotAvaliable {
    /// Open in browser
    public static var button: String { return CourseLocalization.tr("Localizable", "NOT_AVALIABLE.BUTTON", fallback: "Open in browser") }
    /// Explore other parts of this course or view this on web.
    public static var description: String { return CourseLocalization.tr("Localizable", "NOT_AVALIABLE.DESCRIPTION", fallback: "Explore other parts of this course or view this on web.") }
    /// This interactive component isn't available on mobile
    public static var title: String { return CourseLocalization.tr("Localizable", "NOT_AVALIABLE.TITLE", fallback: "This interactive component isn't available on mobile") }
  }
  public enum Offline {
    public enum NotAvaliable {
      /// Explore other parts of this course or view this when you reconnect.
      public static var description: String { return CourseLocalization.tr("Localizable", "OFFLINE.NOT_AVALIABLE.DESCRIPTION", fallback: "Explore other parts of this course or view this when you reconnect.") }
      /// This component is not yet available offline
      public static var title: String { return CourseLocalization.tr("Localizable", "OFFLINE.NOT_AVALIABLE.TITLE", fallback: "This component is not yet available offline") }
    }
    public enum NotDownloaded {
      /// Explore other parts of this course or download this when you reconnect.
      public static var description: String { return CourseLocalization.tr("Localizable", "OFFLINE.NOT_DOWNLOADED.DESCRIPTION", fallback: "Explore other parts of this course or download this when you reconnect.") }
      /// This component is not downloaded
      public static var title: String { return CourseLocalization.tr("Localizable", "OFFLINE.NOT_DOWNLOADED.TITLE", fallback: "This component is not downloaded") }
    }
  }
  public enum Outline {
    /// Certificate
    public static var certificate: String { return CourseLocalization.tr("Localizable", "OUTLINE.CERTIFICATE", fallback: "Certificate") }
    /// This course hasn't started yet.
    public static var courseHasntStarted: String { return CourseLocalization.tr("Localizable", "OUTLINE.COURSE_HASNT_STARTED", fallback: "This course hasn't started yet.") }
    /// Course videos
    public static var courseVideos: String { return CourseLocalization.tr("Localizable", "OUTLINE.COURSE_VIDEOS", fallback: "Course videos") }
    /// Localizable.strings
    ///   Course
    /// 
    ///   Created by  Stepanok Ivan on 26.09.2022.
    public static func passedTheCourse(_ p1: Any) -> String {
      return CourseLocalization.tr("Localizable", "OUTLINE.PASSED_THE_COURSE", String(describing: p1), fallback: "Congratulations, you have earned this course certificate in “%@.”")
    }
    /// View certificate
    public static var viewCertificate: String { return CourseLocalization.tr("Localizable", "OUTLINE.VIEW_CERTIFICATE", fallback: "View certificate") }
  }
  public enum Subtitles {
    /// Subtitles
    public static var title: String { return CourseLocalization.tr("Localizable", "SUBTITLES.TITLE", fallback: "Subtitles") }
  }
  public enum VideoNavigation {
    /// No Video Title
    public static var noVideoTitle: String { return CourseLocalization.tr("Localizable", "VIDEO_NAVIGATION.NO_VIDEO_TITLE", fallback: "No Video Title") }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension CourseLocalization {
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
