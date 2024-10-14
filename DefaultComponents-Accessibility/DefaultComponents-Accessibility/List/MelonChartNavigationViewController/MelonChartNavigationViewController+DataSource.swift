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
    
    func latestCellRegistrationHandler(cell: GridTextCell, indexPath: IndexPath, item: String) {
        cell.text = item
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