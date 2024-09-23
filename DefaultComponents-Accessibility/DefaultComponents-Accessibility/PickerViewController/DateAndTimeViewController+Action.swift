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
    
    @objc func didSelectColor(_ senser: UIColorWell) {
        textForColorWell = senser.selectedColor?.accessibilityName
    }
}
