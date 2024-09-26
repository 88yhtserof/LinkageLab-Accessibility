//
//  DateAndTimeViewController+Delegate.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 9/23/24.
//

import UIKit

extension DateAndTimeViewController: UICalendarViewDelegate, UICalendarSelectionSingleDateDelegate {
    
    func dateSelection(_ selection: UICalendarSelectionSingleDate, didSelectDate dateComponents: DateComponents?) {
        selectedData = dateComponents
        if let date = dateComponents {
            calendarView.reloadDecorations(forDateComponents: [date], animated: true)
        }
    }
}

