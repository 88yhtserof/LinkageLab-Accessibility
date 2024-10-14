//
//  MelonChartNavigationViewControllerWithAccessibility+Delegate.swift
//  DefaultComponents-Accessibility
//
//  Created by 임윤휘 on 10/14/24.
//

import UIKit

extension MelonChartNavigationViewControllerWithAccessibility: UIScrollViewDelegate, UICollectionViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let cell = collectionView.cellForItem(at: IndexPath(item: 0, section: 0)) else { return }
        cell.accessibilityFrame = configureAccessibilityFrame(with: cell, for: .scroll)
    }
}
