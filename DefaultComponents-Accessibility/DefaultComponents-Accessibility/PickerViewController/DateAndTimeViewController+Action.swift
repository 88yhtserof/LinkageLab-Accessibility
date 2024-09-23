//
//  DateAndTimeViewController+Action.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 9/12/24.
//

import UIKit

extension DateAndTimeViewController {
    @objc func didSelectDate(_ sender: UIDatePicker) {
        textForDataPicker = DateFormatterManager.shared.string(from: sender.date)
    }
    
    @objc func didSelectCountdown(_ sender: UIDatePicker) {
        let duration = Int(sender.countDownDuration)
        var hour: Int = 0
        var minute: Int = 0
        var result = ""
        
        if duration > 1200 {
            hour = duration / 60 / 60
        }
        minute = duration / 60 - (60 * hour)
       
        result += hour < 10 ? "0\(hour)" : "\(hour)"
        result += " : "
        result += minute < 10 ? "0\(minute)" : "\(minute)"
        
        textForCountdown = result
    }
}
