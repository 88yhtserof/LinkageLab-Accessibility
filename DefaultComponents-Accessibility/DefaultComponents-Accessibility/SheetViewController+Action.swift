//
//  SheetViewController+Action.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 9/23/24.
//

import UIKit

extension SheetViewController {
    @objc func didTapPresentButton(_ sender: UIButton) {
        let presentVC = TableViewController()
        if let sheet = presentVC.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
            sheet.prefersGrabberVisible = true
        }
        present(presentVC, animated: true)
    }
}
