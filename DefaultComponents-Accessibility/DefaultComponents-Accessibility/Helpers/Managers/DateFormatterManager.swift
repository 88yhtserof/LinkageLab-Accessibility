//
//  DateFormatterManager.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 9/12/24.
//

import Foundation

struct DateFormatterManager {
    
    static let shared = DateFormatterManager()
    
    private var dateFormatter = DateFormatter()
    
    private init() {
        let localIdentifier = Locale.preferredLanguages.first ?? "en-US"
        dateFormatter.dateFormat = "yyyy.MM.dd E HH시 mm분"
        dateFormatter.locale = Locale(identifier: localIdentifier)
    }
    
    func date(from string: String) -> Date? {
        dateFormatter.date(from: string)
    }
    
    func string(from date: Date) -> String {
        dateFormatter.string(from: date)
    }
}
