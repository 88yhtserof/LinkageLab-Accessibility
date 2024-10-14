//
//  MelonChartNavigationViewControllerWithAccessibility+Delegate.swift
//  DefaultComponents-Accessibility
//
//  Created by 임윤휘 on 10/14/24.
//

import UIKit

extension MelonChartNavigationViewControllerWithAccessibility: UIScrollViewDelegate, UICollectionViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let cellForLatest = collectionView.cellForItem(at: IndexPath(item: 0, section: 0)),
              let cellForChart = collectionView.cellForItem(at: IndexPath(item: 0, section: 1)) else { return }
        cellForLatest.accessibilityFrame = AccessibilityFrameForLatest(with: cellForLatest, height: 2, for: .scroll)
        cellForChart.accessibilityFrame = AccessibilityFrameForChart(with: cellForChart, height: 3, for: .scroll)
    }
}

extension MelonChartNavigationViewControllerWithAccessibility: AdjustableForAccessibility {
    func adjustableIncrement(_ view: AnyObject) {
        if view is GridTextCell {
            guard currentPageOfLatest < (books.count - 1) else { return }
            currentPageOfLatest += 1
            configureAccessibilityValue((view as! UICollectionViewCell), current: currentPageOfLatest)
            
            if currentPageOfLatest != 0, currentPageOfLatest % 4 == 0 {
                collectionView.scrollToItem(at: IndexPath(item: currentPageOfLatest, section: 0), at: .left, animated: true)
            }
        } else if view is BorderedListCell {
            guard currentPageOfChart < (books.count - 1) else { return }
            currentPageOfChart += 1
            configureAccessibilityValue((view as! UICollectionViewCell), current: currentPageOfChart)
            
            if currentPageOfChart != 0, currentPageOfChart % 3 == 0 {
                collectionView.scrollToItem(at: IndexPath(item: currentPageOfChart, section: 1), at: .left, animated: true)
            }
        } else {
            fatalError("Unknown View")
        }
    }
    
    func adjustableDecrement(_ view: AnyObject) {
        if view is GridTextCell {
            guard currentPageOfLatest > 0 else { return }
            currentPageOfLatest -= 1
            configureAccessibilityValue((view as! UICollectionViewCell), current: currentPageOfLatest)
            
            if currentPageOfLatest % 4 == 3 {
                collectionView.scrollToItem(at: IndexPath(item: currentPageOfLatest, section: 0), at: .right, animated: true)
            }
        } else if view is BorderedListCell {
            guard currentPageOfChart > 0 else { return }
            currentPageOfChart -= 1
            configureAccessibilityValue((view as! UICollectionViewCell), current: currentPageOfChart)
            
            if currentPageOfChart % 3 == 2 {
                collectionView.scrollToItem(at: IndexPath(item: currentPageOfChart, section: 1), at: .right, animated: true)
            }
        } else {
            fatalError("Unknown View")
        }
    }
}
