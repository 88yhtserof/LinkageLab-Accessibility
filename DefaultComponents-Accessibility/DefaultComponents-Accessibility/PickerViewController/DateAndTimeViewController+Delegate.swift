//
//  DateAndTimeViewController+Delegate.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 9/12/24.
//

import UIKit

extension DateAndTimeViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let itemView = UILabel()
        itemView.text = cities[row]
        itemView.textAlignment = .center
        return itemView
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        textForPicker = cities[row]
    }
}
