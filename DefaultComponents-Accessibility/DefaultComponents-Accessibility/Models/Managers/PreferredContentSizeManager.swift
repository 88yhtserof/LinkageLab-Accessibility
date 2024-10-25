//
//  PreferredContentSizeManager.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 10/24/24.
//

import UIKit

struct PreferredContentSizeManager {
    
    static var shared = PreferredContentSizeManager()
    
    private init() {}
    
    var preferredContentSize = UIApplication.shared.preferredContentSizeCategory.rawValue
    
    private var categoryTitle: String {
        get {
            return UIApplication.shared.preferredContentSizeCategory.isAccessibilityCategory ? "UICTContentSizeCategoryAccessibility" : "UICTContentSizeCategory"
        }
    }
    
    var size: Int {
        let size = String(preferredContentSize.suffix(preferredContentSize.count - categoryTitle.count))
        guard let scale = PreferredContentSize(rawValue: size) else { return 2 }
        switch scale {
        case .extraSmall:
            return 1
        case .small:
            return 2
        case .medium:
            return 3
        case .large:
            return 4
        case .extraLarge:
            return 5
        case .extraExtraLarge:
            return 6
        case .extraExtraExtraLarg:
            return 7
        }
    }
    
    enum PreferredContentSize: String {
        case extraSmall = "XS"
        case small = "S"
        case medium = "M"
        case large = "L"
        case extraLarge = "XL"
        case extraExtraLarge = "XXL"
        case extraExtraExtraLarg = "XXXL"
    }
}
