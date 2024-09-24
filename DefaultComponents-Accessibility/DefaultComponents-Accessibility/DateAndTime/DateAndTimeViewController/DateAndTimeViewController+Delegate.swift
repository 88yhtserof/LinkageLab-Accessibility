//
//  DateAndTimeViewController+Delegate.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 9/23/24.
//

import UIKit

extension DateAndTimeViewController: UICalendarViewDelegate, UICalendarSelectionSingleDateDelegate {
    func calendarView(_ calendarView: UICalendarView, decorationFor dateComponents: DateComponents) -> UICalendarView.Decoration? {
        if dateComponents == selectedData {
            if !dates.contains(dateComponents) {
                dates.insert(dateComponents)
                return .customView {
                    var label = UILabel()
                    label.text = "⭐️"
                    return label
                }
            }
            dates.remove(dateComponents)
        }
        
        return .none
    }
    
    func dateSelection(_ selection: UICalendarSelectionSingleDate, didSelectDate dateComponents: DateComponents?) {
        selectedData = dateComponents
        if let date = dateComponents {
            calendarView.reloadDecorations(forDateComponents: [date], animated: true)
        }
    }
}

