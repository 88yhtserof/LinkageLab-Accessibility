//
//  MelonChartNavigationViewController+DataSource.swift
//  DefaultComponents-Accessibility
//
//  Created by 임윤휘 on 10/13/24.
//

import UIKit

extension MelonChartNavigationViewController {
    typealias DataSource = UICollectionViewDiffableDataSource<Section, Item>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Item>
    
    func latestCellRegistrationHandler(cell: MelonListCell, indexPath: IndexPath, item: String) {
        cell.text = item
    }
    
    func chartCellRegistrationHandler(cell: BorderedListCell, indexPath: IndexPath, item: String) {
        cell.rank = indexPath.item + 1
        cell.text = item
        cell.isAccessibilityElement = true
        
    }
    
    func todayCellRegistrationHandler(cell: BorderedListCell, indexPath: IndexPath, item: String) {
        cell.rank = indexPath.item + 1
        cell.text = item
        cell.isAccessibilityElement = true
        
    }
    
    func supplementaryRegistrationHandler(supplementaryView: TitleSupplementaryView, string: String, indexPath: IndexPath) {
        let title = snapshot.sectionIdentifiers[indexPath.section].title
        supplementaryView.title = title
    }
    
    func updateSnapshot() {
        let latestItems = books.map{ Item(latest: $0.title) }
        let chartItems = books.map{ Item(chart: $0.title) }
        let todayItems = books.map{ Item(today: $0.title) }
        
        snapshot = Snapshot()
        snapshot.appendSections([.latest, .chart, .today])
        snapshot.appendItems(latestItems, toSection: .latest)
        snapshot.appendItems(chartItems, toSection: .chart)
        snapshot.appendItems(todayItems, toSection: .today)
        dataSource.apply(snapshot)
    }
    
}
