//
//  SwitchViewController+Action.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 9/20/24.
//

import UIKit

extension SwitchViewController {
    @objc func didToggleSwitch(_ sender: UISwitch) {
        toggle.isOn.toggle()
        isEnabled = sender.isOn
        updateSnapshot()
    }
    
    func didDoubleTapToSetWiFi() {
        toggle.sendActions(for: .valueChanged)
    }
}
