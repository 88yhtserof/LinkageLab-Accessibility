//
//  ButtonAndSliderViewController+Action.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 9/10/24.
//

import UIKit

extension ButtonAndSliderViewController {
    @objc func didTouchUpInside(_ sender: UIButton) {
        if sender == imageButton {
            isLightOn.toggle()
        } else {
            isLightOnForAccessibility.toggle()
        }
    }
    
    @objc func didChangeValue(_ sender: UISlider) {
        if sender == slider {
            sliderValue = CGFloat(sender.value)
        } else {
            sliderValueAccessibility = CGFloat(sender.value)
        }
    }
    
    func didDoubleTapToSetAccessibility() {
        UIAccessibility.post(notification: .layoutChanged, argument: sliderAccessibility)
    }
}
