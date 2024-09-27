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
            UIAccessibility.post(notification: .layoutChanged, argument: activityIndicator)
        } else {
            activityIndicator.stopAnimating()
        }
        UIAccessibility.post(notification: .layoutChanged, argument: activityIndicator)
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
