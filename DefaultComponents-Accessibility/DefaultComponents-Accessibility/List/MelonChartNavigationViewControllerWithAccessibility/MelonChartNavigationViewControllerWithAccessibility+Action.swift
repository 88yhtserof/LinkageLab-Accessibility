//
//  MelonChartNavigationViewControllerWithAccessibility+Action.swift
//  DefaultComponents-Accessibility
//
//  Created by 임윤휘 on 10/14/24.
//

import UIKit

extension MelonChartNavigationViewControllerWithAccessibility {
    func configureAccessibilityValue(_ cell: UICollectionViewCell, current index: Int, for section: Section) {
        let label: String
        let value: String
        
        if section == .latest {
            label = books[index].title
            value = "총 \(books.count) 페이지 중 \(index + 1) 페이지"
        } else {
            label = "\(index + 1)위, \(books[index].title)"
            value = "총 \(books.count) 페이지 중 \(index + 1) 페이지"
        }
        let descriptions = [label, value]
        cell.accessibilityLabel = nil
        cell.accessibilityValue = descriptions.compactMap({ $0 }).joined(separator: ", ")
    }
}
