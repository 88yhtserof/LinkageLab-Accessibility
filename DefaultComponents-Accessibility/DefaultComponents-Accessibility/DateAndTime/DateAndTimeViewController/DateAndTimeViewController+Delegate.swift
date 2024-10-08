//
//  DateAndTimeViewController+Delegate.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 9/23/24.
//

import UIKit

extension DateAndTimeViewController: UICalendarViewDelegate {
    func calendarView(_ calendarView: UICalendarView, decorationFor dateComponents: DateComponents) -> UICalendarView.Decoration? {
        
        let publicHolidayComponentsList = publicHolidays.map{
            let date = Calendar.current.date(byAdding: .day, value: 0, to: $0.locdate)!
            return Calendar.current.dateComponents([.year, .month, .day], from: date)
        }
        
        if let index = publicHolidayComponentsList.firstIndex(where: {
            $0.year == dateComponents.year && $0.month == dateComponents.month && $0.day == dateComponents.day
        }) {
            return .customView {
                let dateNameLabel = UILabel()
                dateNameLabel.text = self.publicHolidays[index].dateName
                dateNameLabel.backgroundColor = .green
                dateNameLabel.font = UIFont.preferredFont(forTextStyle: .caption2)
                return dateNameLabel
            }
        }
        
        return nil
    }
    
}

extension DateAndTimeViewController: UICalendarSelectionSingleDateDelegate {
    
    func dateSelection(_ selection: UICalendarSelectionSingleDate, didSelectDate dateComponents: DateComponents?) {
        selectedData = dateComponents
        if let date = dateComponents {
            calendarView.reloadDecorations(forDateComponents: [date], animated: true)
        }
    }
}

