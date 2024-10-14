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

extension MelonChartNavigationViewControllerWithAccessibility: AdjustableForAccessibilityDelegate {
    func adjustableIncrement(_ view: UICollectionViewCell) {
        guard currentPageOfLatest < (books.count - 1) else { return }
        currentPageOfLatest += 1
        configureAccessibilityValue(view, current: currentPageOfLatest)
        
        if currentPageOfLatest != 0, currentPageOfLatest % 4 == 0 {
            collectionView.scrollToItem(at: IndexPath(item: currentPageOfLatest, section: 0), at: .left, animated: true)
        }
    }
    
    func adjustableDecrement(_ view: UICollectionViewCell) {
        guard currentPageOfLatest > 0 else { return }
        currentPageOfLatest -= 1
        configureAccessibilityValue(view, current: currentPageOfLatest)
        
        if currentPageOfLatest % 4 == 3 {
            collectionView.scrollToItem(at: IndexPath(item: currentPageOfLatest, section: 0), at: .right, animated: true)
        }
    }
}
