//
//  UIAccessibility+.swift
//  IssueCard
//
//  Created by 링키지랩 on 10/16/24.
//

import UIKit

extension UIAccessibility {
    @MainActor
    static func announceString(for str: String) async {
        try? await Task.sleep(for: .seconds(0.1))
        
        UIAccessibility.post(notification: .announcement, argument: str)
    }
}
