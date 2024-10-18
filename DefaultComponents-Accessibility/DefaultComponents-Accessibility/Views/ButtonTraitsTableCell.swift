//
//  ButtonTraitsTableCell.swift
//  DefaultComponents-Accessibility
//
//  Created by 임윤휘 on 10/18/24.
//

import UIKit

class ButtonTraitsTableCell: UITableViewCell {
    
    override var accessibilityTraits: UIAccessibilityTraits {
        get {
            return .button
        }
        set {}
    }
}
