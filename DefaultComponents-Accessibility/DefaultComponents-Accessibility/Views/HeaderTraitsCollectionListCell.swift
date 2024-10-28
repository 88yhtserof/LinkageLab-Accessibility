//
//  HeaderTraitsCollectionListCell.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 10/28/24.
//

import UIKit

class HeaderTraitsCollectionListCell: UICollectionViewListCell {
    override var accessibilityTraits: UIAccessibilityTraits {
        get { .header }
        set {}
    }
}
