//
//  CourseSessionBlockTests.swift
//  CourseTests
//
//  Created by tenkalden on 13.10.2026.
//

import XCTest
@testable import Core
@testable import Course

final class CourseSessionBlockTests: XCTestCase {

    private let locale = Locale(identifier: "en_US")
    private var savedTimeZone: TimeZone!

    override func setUp() {
        super.setUp()
        savedTimeZone = NSTimeZone.default
    }

    override func tearDown() {
        NSTimeZone.default = savedTimeZone
        super.tearDown()
    }

    private func session(
        startDate: String = "2026-10-12",
        endDate: String? = nil,
        numDays: Int = 1,
        startTime: String? = "19:00",
        endTime: String? = "20:30",
        timezoneAbbr: String = "IST",
        contentAvailableFrom: String? = nil,
        useRelativeDates: Bool = false
    ) -> CourseSessionBlock {
        CourseSessionBlock(
            id: "block-v1:Sherab+DTIPC+2026+type@chapter+block@\(startDate)",
            title: "Day 1: Introduction",
            startDate: startDate,
            endDate: endDate ?? startDate,
            numDays: numDays,
            startTime: startTime,
            endTime: endTime,
            timezoneAbbr: timezoneAbbr,
            instructor: "",
            toolsRequired: "",
            notes: "",
            contentAvailableFrom: contentAvailableFrom,
            useRelativeDates: useRelativeDates
        )
    }

    /// Recent ICU versions put a narrow no-break space before AM/PM.
    private func normalized(_ text: String?) -> String? {
        text?.replacingOccurrences(of: "\u{202F}", with: " ")
    }

    // MARK: - Decoding

    func testDecodesScheduleResponse() throws {
        let json = """
        {
          "enabled": true,
          "timezone": "Asia/Kolkata",
          "sessions": [
            {
              "section_id": "block-v1:Sherab+DTIPC+2026+type@chapter+block@abc123",
              "title": "Day 1: Introduction",
              "start_date": "2026-10-12",
              "end_date": "2026-10-12",
              "num_days": 1,
              "start_time": "19:00",
              "end_time": "20:30",
              "timezone_abbr": "IST",
              "instructor": "Geshe Tenzin",
              "tools_required": "Workbook, Zoom",
              "notes": "Bring a cushion",
              "content_available_from": null
            },
            {
              "section_id": "block-v1:Sherab+DTIPC+2026+type@chapter+block@def456",
              "title": "Retreat",
              "start_date": "2026-10-13",
              "end_date": "2026-10-14",
              "num_days": 2,
              "start_time": null,
              "end_time": null,
              "timezone_abbr": "IST",
              "instructor": "",
              "tools_required": "",
              "notes": "",
              "content_available_from": "2026-10-20"
            }
          ]
        }
        """
        let response = try JSONDecoder().decode(DataLayer.CourseSchedule.self, from: Data(json.utf8))
        let sessions = response.domain(useRelativeDates: false)

        XCTAssertEqual(sessions.count, 2)
        XCTAssertEqual(sessions[0].id, "block-v1:Sherab+DTIPC+2026+type@chapter+block@abc123")
        XCTAssertEqual(sessions[0].title, "Day 1: Introduction")
        XCTAssertEqual(sessions[0].startTime, "19:00")
        XCTAssertEqual(sessions[0].instructor, "Geshe Tenzin")
        XCTAssertEqual(sessions[0].toolsRequired, "Workbook, Zoom")
        XCTAssertEqual(sessions[0].notes, "Bring a cushion")
        XCTAssertNil(sessions[0].contentAvailableFrom)
        XCTAssertNil(sessions[1].startTime)
        XCTAssertNil(sessions[1].endTime)
        XCTAssertEqual(sessions[1].numDays, 2)
        XCTAssertEqual(sessions[1].contentAvailableFrom, "2026-10-20")
    }

    func testDisabledScheduleHasNoSessions() throws {
        let json = #"{"enabled": false, "timezone": "Asia/Kolkata", "sessions": []}"#
        let response = try JSONDecoder().decode(DataLayer.CourseSchedule.self, from: Data(json.utf8))
        XCTAssertTrue(response.domain(useRelativeDates: false).isEmpty)
    }

    // MARK: - Display text

    func testTimeTextWithStartAndEnd() {
        XCTAssertEqual(normalized(session().timeText(locale: locale)), "7:00 PM–8:30 PM IST")
    }

    func testTimeTextWithStartOnly() {
        XCTAssertEqual(normalized(session(endTime: nil).timeText(locale: locale)), "7:00 PM IST")
    }

    func testTimeTextWithoutStartTime() {
        XCTAssertNil(session(startTime: nil, endTime: nil).timeText(locale: locale))
    }

    func testOvernightTimesAreShownAsGiven() {
        let overnight = session(startTime: "22:00", endTime: "00:30")
        XCTAssertEqual(normalized(overnight.timeText(locale: locale)), "10:00 PM–12:30 AM IST")
    }

    func testTimeTextFollows24HourLocale() {
        XCTAssertEqual(session().timeText(locale: Locale(identifier: "en_GB")), "19:00–20:30 IST")
    }

    func testSingleDayHasNoDaysTextWhenHeaderShowsTheDate() {
        XCTAssertNil(session().daysText(locale: locale))
    }

    func testSingleDayShowsItsDateWithRelativeDates() {
        let relative = session(useRelativeDates: true)
        XCTAssertEqual(relative.daysText(locale: locale), "Oct 12, 2026")
        XCTAssertEqual(normalized(relative.whenText(locale: locale)), "7:00 PM–8:30 PM IST · Oct 12, 2026")
    }

    func testSingleDayWithoutTimeStillShowsItsDateWithRelativeDates() {
        let relative = session(startTime: nil, endTime: nil, useRelativeDates: true)
        XCTAssertEqual(relative.whenText(locale: locale), "Oct 12, 2026")
    }

    func testMultiDayTextIsTheSameWithRelativeDates() {
        let multiDay = session(startDate: "2026-10-13", endDate: "2026-10-14", numDays: 2, useRelativeDates: true)
        XCTAssertEqual(multiDay.daysText(locale: locale), "Oct 13 – Oct 14, 2026")
    }

    func testMultiDayTextPutsYearOnEndDate() {
        let multiDay = session(startDate: "2026-10-13", endDate: "2026-10-14", numDays: 2)
        XCTAssertEqual(multiDay.daysText(locale: locale), "Oct 13 – Oct 14, 2026")
    }

    func testMultiDayTextAcrossYearsPutsYearOnBothDates() {
        let multiDay = session(startDate: "2026-12-31", endDate: "2027-01-02", numDays: 3)
        XCTAssertEqual(multiDay.daysText(locale: locale), "Dec 31, 2026 – Jan 2, 2027")
    }

    func testWhenTextJoinsTimeAndDays() {
        let multiDay = session(startDate: "2026-10-13", endDate: "2026-10-14", numDays: 2)
        XCTAssertEqual(normalized(multiDay.whenText(locale: locale)), "7:00 PM–8:30 PM IST · Oct 13 – Oct 14, 2026")
    }

    func testWhenTextIsNilWithoutTimeOrDays() {
        XCTAssertNil(session(startTime: nil, endTime: nil).whenText(locale: locale))
    }

    func testContentAvailableFromText() {
        let late = session(contentAvailableFrom: "2026-10-20")
        XCTAssertEqual(late.contentAvailableFromText(locale: locale), "Oct 20, 2026")
        XCTAssertNil(session().contentAvailableFromText(locale: locale))
    }

    func testTextIsTheSameInEveryDeviceTimezone() {
        let multiDay = session(startDate: "2026-10-13", endDate: "2026-10-14", numDays: 2)
        var results: Set<String> = []
        for identifier in ["America/Los_Angeles", "Asia/Kolkata", "Pacific/Kiritimati", "UTC"] {
            NSTimeZone.default = TimeZone(identifier: identifier)!
            let text = [
                multiDay.whenText(locale: locale),
                multiDay.contentAvailableFromText(locale: locale),
                session(contentAvailableFrom: "2026-10-20").contentAvailableFromText(locale: locale)
            ].compactMap { $0 }.joined(separator: "|")
            results.insert(text)
        }
        XCTAssertEqual(results.count, 1)
    }

    // MARK: - Placement

    private func calendar(_ identifier: String) -> Calendar {
        var calendar = Calendar(identifier: .gregorian)
        calendar.timeZone = TimeZone(identifier: identifier)!
        return calendar
    }

    private func date(_ calendar: Calendar, _ year: Int, _ month: Int, _ day: Int, hour: Int = 10) -> Date {
        calendar.date(from: DateComponents(year: year, month: month, day: day, hour: hour))!
    }

    func testStatusBoundaries() {
        let calendar = calendar("Asia/Kolkata")
        let today = date(calendar, 2026, 10, 13)
        let cases: [(String, CompletionStatus)] = [
            ("2026-10-12", .past),
            ("2026-10-13", .today),
            ("2026-10-14", .thisWeek),
            ("2026-10-21", .thisWeek),
            ("2026-10-22", .nextWeek),
            ("2026-10-28", .nextWeek),
            ("2026-10-29", .upcoming)
        ]
        for (startDate, expected) in cases {
            XCTAssertEqual(
                session(startDate: startDate).status(today: today, calendar: calendar),
                expected,
                startDate
            )
        }
    }

    func testSessionEarlierTodayIsStillToday() {
        let calendar = calendar("Asia/Kolkata")
        let lateEvening = date(calendar, 2026, 10, 13, hour: 23)
        let morningSession = session(startDate: "2026-10-13", startTime: "06:00", endTime: "07:00")
        XCTAssertEqual(morningSession.status(today: lateEvening, calendar: calendar), .today)
    }

    func testPlacementUsesTheCalendarDayInEveryDeviceTimezone() {
        for identifier in ["America/Los_Angeles", "Asia/Kolkata", "Pacific/Kiritimati", "Pacific/Pago_Pago"] {
            let calendar = calendar(identifier)
            for hour in [0, 12, 23] {
                let today = date(calendar, 2026, 10, 13, hour: hour)
                XCTAssertEqual(session(startDate: "2026-10-13").dayOffset(from: today, calendar: calendar), 0, identifier)
                XCTAssertEqual(session(startDate: "2026-10-12").dayOffset(from: today, calendar: calendar), -1, identifier)
                XCTAssertEqual(session(startDate: "2026-10-14").dayOffset(from: today, calendar: calendar), 1, identifier)
            }
        }
    }

    func testEntriesInterleaveDatesAndSessionsByDay() {
        let calendar = Calendar.current
        let dueDate = calendar.date(from: DateComponents(year: 2026, month: 10, day: 13, hour: 23, minute: 59))!
        let block = CourseDateBlock(
            assignmentType: nil,
            complete: false,
            date: dueDate,
            dateType: "assignment-due-date",
            description: "",
            learnerHasAccess: true,
            link: "",
            linkText: nil,
            title: "Quiz",
            extraInfo: nil,
            firstComponentBlockID: "",
            useRelativeDates: false
        )
        let entries = DatesEntry.entries(
            dates: [dueDate: [block]],
            sessions: [session(startDate: "2026-10-14"), session(startDate: "2026-10-12")]
        )
        XCTAssertEqual(entries.map(\.id), [
            "session-block-v1:Sherab+DTIPC+2026+type@chapter+block@2026-10-12",
            "dates-\(dueDate.timeIntervalSince1970)",
            "session-block-v1:Sherab+DTIPC+2026+type@chapter+block@2026-10-14"
        ])
    }
}
