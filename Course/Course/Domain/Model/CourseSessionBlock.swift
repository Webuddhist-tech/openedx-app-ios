//
//  CourseSessionBlock.swift
//  Course
//
//  Created by tenkalden on 13.10.2026.
//

import Foundation
import Core

/// A scheduled live session for a course section, shown on the Dates screen.
///
/// Dates and times are wall-clock values in the course timezone ("2026-10-12", "19:00").
/// They are always shown exactly as given, never converted to the device timezone, so all
/// formatting below works on the raw parts with a UTC calendar.
public struct CourseSessionBlock: Identifiable, Hashable, Sendable {
    public let id: String
    public let title: String
    public let startDate: String
    public let endDate: String
    public let numDays: Int
    public let startTime: String?
    public let endTime: String?
    public let timezoneAbbr: String
    public let instructor: String
    public let toolsRequired: String
    public let notes: String
    public let contentAvailableFrom: String?
    public let useRelativeDates: Bool

    public init(
        id: String,
        title: String,
        startDate: String,
        endDate: String,
        numDays: Int,
        startTime: String?,
        endTime: String?,
        timezoneAbbr: String,
        instructor: String,
        toolsRequired: String,
        notes: String,
        contentAvailableFrom: String?,
        useRelativeDates: Bool
    ) {
        self.id = id
        self.title = title
        self.startDate = startDate
        self.endDate = endDate
        self.numDays = numDays
        self.startTime = startTime
        self.endTime = endTime
        self.timezoneAbbr = timezoneAbbr
        self.instructor = instructor
        self.toolsRequired = toolsRequired
        self.notes = notes
        self.contentAvailableFrom = contentAvailableFrom
        self.useRelativeDates = useRelativeDates
    }

    // MARK: - Placement on the timeline

    /// Midday of `startDate` in the device calendar. Midday keeps the session on its own
    /// calendar day whatever the device timezone. Start-time minutes are added as seconds
    /// so sessions on the same day keep their time order.
    public func localDate(calendar: Calendar = .current) -> Date? {
        guard let day = Self.dayComponents(startDate) else { return nil }
        var components = day
        components.hour = 12
        components.second = Self.minutesOfDay(startTime) ?? 0
        return calendar.date(from: components)
    }

    /// Whole calendar days from `today` to `startDate`: 0 for today, negative when past.
    public func dayOffset(from today: Date = Date(), calendar: Calendar = .current) -> Int? {
        guard let date = localDate(calendar: calendar) else { return nil }
        return calendar.dateComponents(
            [.day],
            from: calendar.startOfDay(for: today),
            to: calendar.startOfDay(for: date)
        ).day
    }

    /// The Dates screen section the session belongs to. The ranges match where
    /// `CourseDates.statusDatesBlocks` puts a course date later than midnight on the same day:
    /// `Date.isThisWeek` ends at the start of day 8 and `isNextWeek` at the start of day 15.
    public func status(today: Date = Date(), calendar: Calendar = .current) -> CompletionStatus {
        guard let offset = dayOffset(from: today, calendar: calendar) else { return .upcoming }
        switch offset {
        case ..<0: return .past
        case 0: return .today
        case 1...7: return .thisWeek
        case 8...14: return .nextWeek
        default: return .upcoming
        }
    }

    /// Date header text, in the same style as `CourseDateBlock.formattedDate`.
    public var formattedDate: String {
        guard let date = localDate() else { return startDate }
        return date.dateToString(style: .shortWeekdayMonthDayYear, useRelativeDates: useRelativeDates)
    }

    // MARK: - Display text

    /// "7:00 PM–8:30 PM IST", "7:00 PM IST", or nil when there is no start time.
    public func timeText(locale: Locale = .current) -> String? {
        guard let start = Self.formatTime(startTime, locale: locale) else { return nil }
        var text = start
        if let end = Self.formatTime(endTime, locale: locale) {
            text += "–" + end
        }
        if !timezoneAbbr.isEmpty {
            text += " " + timezoneAbbr
        }
        return text
    }

    /// "Oct 13 – Oct 14, 2026" for a multi-day session. A single day is "Oct 13, 2026" when
    /// relative dates are on (the date header then reads "Tomorrow", "Thursday"...), and nil
    /// otherwise because the header already shows the date.
    /// The end date carries the year; the start date does too when it is in another year.
    public func daysText(locale: Locale = .current) -> String? {
        guard numDays > 1 else {
            return useRelativeDates ? Self.formatDay(startDate, withYear: true, locale: locale) : nil
        }
        let startsInOtherYear = startDate.prefix(4) != endDate.prefix(4)
        guard let start = Self.formatDay(startDate, withYear: startsInOtherYear, locale: locale),
              let end = Self.formatDay(endDate, withYear: true, locale: locale) else { return nil }
        return start + " – " + end
    }

    /// The days and time joined with " · ", e.g. "15 Oct 2026 · 8:30 am–11:30 am IST",
    /// or nil when neither exists.
    public func whenText(locale: Locale = .current) -> String? {
        let parts = [daysText(locale: locale), timeText(locale: locale)].compactMap { $0 }
        return parts.isEmpty ? nil : parts.joined(separator: " · ")
    }

    /// The content release date with year, e.g. "Oct 20, 2026".
    public func contentAvailableFromText(locale: Locale = .current) -> String? {
        guard let contentAvailableFrom else { return nil }
        return Self.formatDay(contentAvailableFrom, withYear: true, locale: locale)
    }

    // MARK: - Raw value helpers

    private static let utcCalendar: Calendar = {
        var calendar = Calendar(identifier: .gregorian)
        calendar.timeZone = TimeZone(identifier: "UTC") ?? .current
        return calendar
    }()

    /// Year, month and day of a "YYYY-MM-DD" string.
    static func dayComponents(_ value: String) -> DateComponents? {
        let parts = value.split(separator: "-").compactMap { Int($0) }
        guard parts.count == 3 else { return nil }
        return DateComponents(year: parts[0], month: parts[1], day: parts[2])
    }

    /// Minutes since midnight of an "HH:mm" string.
    static func minutesOfDay(_ value: String?) -> Int? {
        guard let parts = value?.split(separator: ":").compactMap({ Int($0) }),
              parts.count >= 2 else { return nil }
        return parts[0] * 60 + parts[1]
    }

    private static func formatDay(_ value: String, withYear: Bool, locale: Locale) -> String? {
        guard let components = dayComponents(value),
              let date = utcCalendar.date(from: components) else { return nil }
        return SessionFormatterCache.shared
            .formatter(template: withYear ? "MMMdyyyy" : "MMMd", locale: locale, calendar: utcCalendar)
            .string(from: date)
    }

    private static func formatTime(_ value: String?, locale: Locale) -> String? {
        guard let minutes = minutesOfDay(value),
              let date = utcCalendar.date(from: DateComponents(
                year: 1970, month: 1, day: 1, hour: minutes / 60, minute: minutes % 60
              )) else { return nil }
        // "jmm" follows the locale's 12/24 h preference.
        return SessionFormatterCache.shared
            .formatter(template: "jmm", locale: locale, calendar: utcCalendar)
            .string(from: date)
    }
}

/// Reuses the UTC date formatters for session text, which is built on every render of the
/// Dates list. The key includes the hour cycle so a 12/24 h change in Settings is picked up.
private final class SessionFormatterCache: @unchecked Sendable {
    static let shared = SessionFormatterCache()

    private let lock = NSLock()
    private var formatters: [String: DateFormatter] = [:]

    func formatter(template: String, locale: Locale, calendar: Calendar) -> DateFormatter {
        let key = "\(template)|\(locale.identifier)|\(locale.hourCycle)"
        lock.lock()
        defer { lock.unlock() }
        if let formatter = formatters[key] {
            return formatter
        }
        let formatter = DateFormatter()
        formatter.calendar = calendar
        formatter.timeZone = calendar.timeZone
        formatter.locale = locale
        formatter.setLocalizedDateFormatFromTemplate(template)
        formatters[key] = formatter
        return formatter
    }
}
