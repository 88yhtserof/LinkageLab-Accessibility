//
//  TextViewController+Action.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 9/10/24.
//

import UIKit

extension TextViewController {
    
    @objc func didSelectCopyButton(_ sender: UIButton) {
        UIPasteboard.general.string = textField.text
    }
}
