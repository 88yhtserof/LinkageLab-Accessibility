//
//  UIAccessibility+Focus.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 10/4/24.
//

import UIKit

extension UIAccessibility {
    @MainActor
    static func setFocus(to object: Any) async throws {
        guard UIAccessibility.isVoiceOverRunning else { return }
        
        try await Task.sleep(for: .seconds(0.08))
        UIAccessibility.post(notification: .layoutChanged, argument: object)
    }
}
