//
//  DateUtils.swift
//  NubbleSwiftUI
//
//  Created by Willian Peres on 06/05/24.
//

import Foundation

struct DateUtils {
    func fromISOString(_ isoString: String, formatOptions: ISO8601DateFormatter.Options = []) -> Date? {
        let isoDateFormatter = ISO8601DateFormatter()
        isoDateFormatter.formatOptions = formatOptions
        return isoDateFormatter.date(from: isoString)
    }
    
    // Get the difference between Date.now and the provided Date
    func formatRelative(from dateISO: String) -> String? {
        guard let date = fromISOString(dateISO, formatOptions: [.withInternetDateTime, .withFractionalSeconds]) else {
            return nil
        }
        
        let diffInSeconds = round(Date.now.timeIntervalSince(date))
        if diffInSeconds < 0 {
            return date.formatted(.dateTime.day(.twoDigits).month(.twoDigits).year(.extended()))
        }
        
        if diffInSeconds < 60 {
            return "\(Int(diffInSeconds)) s"
        }
        
        let diffInMinutes = round(diffInSeconds / 60)
        if diffInMinutes < 60 {
            return "\(Int(diffInMinutes)) m"
        }
        
        let diffInHours = floor(diffInMinutes / 60)
        if diffInHours < 24 {
            return "\(Int(diffInHours)) h"
        }
        
        let diffInDays = floor(diffInHours / 24)
        if diffInDays < 7 {
            return "\(Int(diffInDays)) d"
        }
        
        let diffInWeeks = floor(diffInDays / 7)
        if diffInWeeks <= 4 {
            return "\(Int(diffInWeeks)) sem"
        }
        
        let diffInMonths = floor(diffInDays / 30)
        if diffInMonths < 12 {
            return "\(Int(diffInMonths)) mes"
        }
        
        return date.formatted(.dateTime.day(.twoDigits).month(.twoDigits).year(.extended()))
    }
}
