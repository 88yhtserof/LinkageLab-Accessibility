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
            cell.accessibilityFrame = configureAccessibilityFrame(with: cell, for: .initial)
            cell.accessibilityLabel = item
            cell.accessibilityValue = "총 \(books.count) 페이지 중 \(indexPath.item + 1) 페이지"
            cell.accessibilityTraits = [.button, .adjustable]
            cell.delegate = self
        }
    }
    
    func chartCellRegistrationHandler(cell: UICollectionViewCell, indexPath: IndexPath, item: String) {
        var config = UIListContentConfiguration.valueCell()
        config.text = item
        cell.contentConfiguration = config
        cell.contentView.layer.borderWidth = 1
        cell.contentView.layer.borderColor = UIColor.black.cgColor
        
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
        snapshot.appendSections([.latest, .chart])
        snapshot.appendItems(latestItems, toSection: .latest)
        snapshot.appendItems(chartItems, toSection: .chart)
        dataSource.apply(snapshot)
    }
    
}
