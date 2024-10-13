//
//  UIAccessibility+Focus.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 10/4/24.
//

import UIKit

extension UIAccessibility {
    @MainActor
    static func setFocus(to object: Any, for duration: ContinuousClock.Instant.Duration = .seconds(0.03)) async throws {
        guard UIAccessibility.isVoiceOverRunning else { return }
        try await Task.sleep(for: duration)
        UIAccessibility.post(notification: .layoutChanged, argument: object)
    }
}
