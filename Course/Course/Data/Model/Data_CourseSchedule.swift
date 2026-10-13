//
//  Data_CourseSchedule.swift
//  Course
//
//  Created by tenkalden on 13.10.2026.
//

import Foundation
import Core

public extension DataLayer {
    struct CourseSchedule: Codable {
        let enabled: Bool
        let timezone: String?
        let sessions: [CourseSession]?
    }

    struct CourseSession: Codable {
        let sectionID: String
        let title: String
        let startDate: String
        let endDate: String?
        let numDays: Int?
        let startTime: String?
        let endTime: String?
        let timezoneAbbr: String?
        let instructor: String?
        let toolsRequired: String?
        let notes: String?
        let contentAvailableFrom: String?

        enum CodingKeys: String, CodingKey {
            case sectionID = "section_id"
            case title
            case startDate = "start_date"
            case endDate = "end_date"
            case numDays = "num_days"
            case startTime = "start_time"
            case endTime = "end_time"
            case timezoneAbbr = "timezone_abbr"
            case instructor
            case toolsRequired = "tools_required"
            case notes
            case contentAvailableFrom = "content_available_from"
        }
    }
}

public extension DataLayer.CourseSchedule {
    func domain(useRelativeDates: Bool) -> [CourseSessionBlock] {
        guard enabled else { return [] }
        return (sessions ?? []).map { $0.domain(useRelativeDates: useRelativeDates) }
    }
}

public extension DataLayer.CourseSession {
    func domain(useRelativeDates: Bool) -> CourseSessionBlock {
        CourseSessionBlock(
            id: sectionID,
            title: title,
            startDate: startDate,
            endDate: endDate ?? startDate,
            numDays: numDays ?? 1,
            startTime: startTime,
            endTime: endTime,
            timezoneAbbr: timezoneAbbr ?? "",
            instructor: instructor ?? "",
            toolsRequired: toolsRequired ?? "",
            notes: notes ?? "",
            contentAvailableFrom: contentAvailableFrom,
            useRelativeDates: useRelativeDates
        )
    }
}
