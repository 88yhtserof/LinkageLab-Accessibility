//
//  StateViewController+Delegate.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 9/23/24.
//

import UIKit

// MARK: TextField Delegate
extension StateViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        if let textForURL = textField.text, !textForURL.isEmpty,
           let url = URL(string: textForURL) {
            Task {
                try await loadImage(url)
            }
        }
        return true
    }
}

// MARK: URLSession Delegate
extension StateViewController: URLSessionDataDelegate {
    func urlSession(_ session: URLSession, didCreateTask task: URLSessionTask) {
        Task { @MainActor in
            self.progressView.setProgress(1.0, animated: true)
            
        }
    }
}
