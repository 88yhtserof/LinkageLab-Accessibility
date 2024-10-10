//
//  PublicHoliday.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 10/8/24.
//

import Foundation

struct PublicHoliday {
    let dateName: String
    let locdate: Date
}

extension PublicHoliday {
    static let samples = [
        PublicHoliday(dateName: "국군의 날", locdate: Calendar.current.date(from: DateComponents(year: 2024, month: 10, day: 1)) ?? Date()),
        PublicHoliday(dateName: "개천절", locdate: Calendar.current.date(from: DateComponents(year: 2024, month: 10, day: 3)) ?? Date()),
        PublicHoliday(dateName: "한글날", locdate: Calendar.current.date(from: DateComponents(year: 2024, month: 10, day: 9)) ?? Date())
    ]
}
