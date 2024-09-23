//
//  DateAndTimeViewController+DatsSource.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 9/13/24.
//

import UIKit

extension DateAndTimeViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cities.count
    }
}
