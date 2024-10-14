//
//  MelonChartNavigationViewControllerWithAccessibility+Action.swift
//  DefaultComponents-Accessibility
//
//  Created by 임윤휘 on 10/14/24.
//

import UIKit

extension MelonChartNavigationViewControllerWithAccessibility {
    func AccessibilityFrameForLatest(with cell: UICollectionViewCell, height: CGFloat, for state: AccessibilityFrameState) -> CGRect {
        let originToView = collectionView.convert(cell.frame.origin, to: view)
        let origin: CGPoint
        switch state {
        case .initial:
            origin = CGPoint(x: originToView.x, y: originToView.y + collectionView.contentOffset.y - 10)
        case .scroll:
            origin = CGPoint(x: originToView.x, y: originToView.y)
        }
        let size = CGSize(width: view.frame.width - 20, height: cell.frame.height * height)
        return CGRect(origin: origin, size: size)
    }
    
    func AccessibilityFrameForChart(with cell: UICollectionViewCell, height: CGFloat, for state: AccessibilityFrameState) -> CGRect {
        let originToView = collectionView.convert(cell.frame.origin, to: view)
        let origin: CGPoint
        switch state {
        case .initial:
            origin = CGPoint(x: originToView.x, y: originToView.y + collectionView.contentOffset.y - 35)
        case .scroll:
            origin = CGPoint(x: originToView.x, y: originToView.y)
        }
        let size = CGSize(width: view.frame.width - 20, height: cell.frame.height * height + 10)
        return CGRect(origin: origin, size: size)
    }
    
    func configureAccessibilityValue(_ cell: UICollectionViewCell, current index: Int) {
        let label = books[index].title
        let value = "총 \(books.count) 페이지 중 \(index + 1) 페이지"
        let descriptions = [label, value]
        cell.accessibilityValue = descriptions.compactMap({ $0 }).joined(separator: ", ")
    }
}
