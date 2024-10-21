//
//  ButtonTraitsCollectionListCell.swift
//  DefaultComponents-Accessibility
//
//  Created by 임윤휘 on 10/20/24.
//

import UIKit

class ButtonTraitsCollectionListCell: UICollectionViewListCell {
    
    override var accessibilityTraits: UIAccessibilityTraits {
        get { .button }
        set {}
    }
}
