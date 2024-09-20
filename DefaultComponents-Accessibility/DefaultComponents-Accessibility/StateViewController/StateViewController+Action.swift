//
//  StateViewController+Action.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 9/11/24.
//

import UIKit

extension StateViewController {
    
    @objc func didToggleSwitch(_ sender: UISwitch) {
        if switchControl.isOn {
            activityIndicator.startAnimating()
        } else {
            activityIndicator.stopAnimating()
        }
    }
}
