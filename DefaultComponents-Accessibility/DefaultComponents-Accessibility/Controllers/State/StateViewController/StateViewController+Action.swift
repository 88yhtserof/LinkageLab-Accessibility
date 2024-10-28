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
    
    @objc func didToggleSwitchWithAccessibility(_ sender: UISwitch) {
        if switchControlWithAccessibility.isOn {
            activityIndicatorWithAccessibility.startAnimating()
        } else {
            activityIndicatorWithAccessibility.stopAnimating()
        }
        UIAccessibility.post(notification: .layoutChanged, argument: activityIndicatorWithAccessibility)
    }
    
    func loadImage(_ url: URL) async throws {
        do {
            let image = try await imageLoader.loadImage(from: url, delegate: self)
            imageView.image = image
        } catch {
            let alert = UIAlertController(title: "오류", message: "URL을 확인해주세요.", preferredStyle: .alert)
            alert.addAction(.init(title: "확인", style: .default))
            present(alert, animated: true)
            return
        }
    }
}
