//
//  ButtonAndSliderViewController+Action.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 9/10/24.
//

import UIKit

extension ButtonAndSliderViewController {
    @objc func didTapLightButton(_ sender: UIButton) {
        if sender == imageButton {
            isLightOn.toggle()
        } else {
            isLightOnForAccessibility.toggle()
        }
    }
    
    @objc func didChangeValue(_ sender: UISlider) {
        sliderValue = CGFloat(sender.value)
    }
    
    @objc func didTouchDown(_ sender: UIButton) {
        sender.alpha = 0.5
    }
    
    @objc func didTouchUp(_ sender: UIButton) {
        sender.alpha = 1.0
    }
}
