//
//  ButtonViewController+Action.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 9/10/24.
//

import UIKit

extension ButtonViewController {
    @objc func didTouchUpInside(_ sender: UIButton) {
        isLightOn.toggle()
    }
}
