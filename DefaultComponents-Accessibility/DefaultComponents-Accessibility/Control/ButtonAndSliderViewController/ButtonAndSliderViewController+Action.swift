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
        sliderValue = CGFloat(sender.value)
    }
    
    func didDoubleTapToSetAccessibility() {
        UIAccessibility.post(notification: .layoutChanged, argument: slider)
    }
}
