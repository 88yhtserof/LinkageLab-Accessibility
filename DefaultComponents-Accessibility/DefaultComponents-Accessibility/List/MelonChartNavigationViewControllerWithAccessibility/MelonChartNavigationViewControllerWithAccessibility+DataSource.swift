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
    
    func latestCellRegistrationHandler(cell: GridTextCell, indexPath: IndexPath, item: String) {
        cell.text = item
        cell.isAccessibilityForText = false
        
        if indexPath.item == 0 {
            cell.isAccessibilityElement = true
            cell.accessibilityFrame = configureAccessibilityFrame(with: cell, for: .initial)
            cell.accessibilityLabel = item
            cell.accessibilityValue = "총 \(samples.count) 페이지 중 \(indexPath.item + 1) 페이지"
            cell.accessibilityTraits = [.button, .adjustable]
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
        let latestItems = samples.map{ Item(latest: $0) }
        let chartItems = samples.map{ Item(chart: $0) }
        
        snapshot = Snapshot()
        snapshot.appendSections([.latest, .chart])
        snapshot.appendItems(latestItems, toSection: .latest)
        snapshot.appendItems(chartItems, toSection: .chart)
        dataSource.apply(snapshot)
    }
    
}
