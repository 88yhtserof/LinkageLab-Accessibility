//
//  MelonChartNavigationViewControllerWithAccessibility+DataSource.swift
//  DefaultComponents-Accessibility
//
//  Created by 임윤휘 on 10/13/24.
//

import UIKit

extension MelonChartNavigationViewControllerWithAccessibility {
    typealias DataSource = UICollectionViewDiffableDataSource<Section, Item>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Item>
    
    func latestCellRegistrationHandler(cell: GridTextCellWithAccessibility, indexPath: IndexPath, item: String) {
        cell.text = item
        
        if indexPath.item == 0 {
            cell.isAccessibilityElement = true
            cell.accessibilityFrame = AccessibilityFrameForLatest(with: cell, height: 2, for: .initial)
            cell.accessibilityLabel = item
            cell.accessibilityValue = "총 \(books.count) 페이지 중 \(indexPath.item + 1) 페이지"
            cell.accessibilityTraits = [.button, .adjustable]
            cell.delegate = self
        }
    }
    
    func chartCellRegistrationHandler(cell: BorderedListCell, indexPath: IndexPath, item: String) {
        cell.rank = indexPath.item + 1
        cell.text = item
        
        if indexPath.item == 0 {
            cell.isAccessibilityElement = true
            cell.accessibilityFrame = AccessibilityFrameForChart(with: cell, height: 3, for: .initial)
            cell.accessibilityLabel = "\(indexPath.item + 1)위, \(item)"
            cell.accessibilityValue = "총 \(books.count) 페이지 중 \(indexPath.item + 1) 페이지"
            cell.accessibilityTraits = [.button, .adjustable]
            cell.delegate = self
        }
        
    }
    
    func customCellRegistrationHandler(cell: InnerCollectionListCell, indexPath: IndexPath, item: Bool) {
        cell.delegate = self
        cell.isAccessibilityElement = true
        cell.accessibilityTraits = [.button, .adjustable]
        cell.accessibilityLabel = "\(indexPath.item + 1)위, \(books[indexPath.item].title)"
        cell.accessibilityValue = "총 \(books.count) 페이지 중 \(currentPageOfCustom + 1) 페이지"
    }
    
    func supplementaryRegistrationHandler(supplementaryView: TitleSupplementaryView, string: String, indexPath: IndexPath) {
        let title = snapshot.sectionIdentifiers[indexPath.section].title
        supplementaryView.title = title
        
        if UIAccessibility.isVoiceOverRunning {
            supplementaryView.isAccessibilityElement = true
            supplementaryView.accessibilityLabel = title
            supplementaryView.accessibilityTraits = .header
        }
    }
    
    func updateSnapshot() {
        let latestItems = books.map{ Item(latest: $0.title) }
        let chartItems = books.map{ Item(chart: $0.title) }
        
        snapshot = Snapshot()
        snapshot.appendSections([.latest, .chart, .custom])
        snapshot.appendItems(latestItems, toSection: .latest)
        snapshot.appendItems(chartItems, toSection: .chart)
        snapshot.appendItems([Item(custom: true)], toSection: .custom)
        dataSource.apply(snapshot)
    }
    
}
