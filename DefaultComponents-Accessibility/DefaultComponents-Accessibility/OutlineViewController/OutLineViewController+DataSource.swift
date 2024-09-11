//
//  OutLineViewController+DataSource.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 9/11/24.
//

import UIKit

// MARK: DataSource
extension OutLineViewController {
    typealias DataSource = UICollectionViewDiffableDataSource<Int, String>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Int, String>
    
    func cellRegistrationHandler(cell: UICollectionViewListCell, indexPath: IndexPath, item: String) {
        var configuration = cell.defaultContentConfiguration()
        configuration.text = item
        cell.contentConfiguration = configuration
    }
    
    func updateSnapshot() {
        let items = ["Button", "Text", "ActiviryIndicatorWithSwitch"]
        var snapshot = Snapshot()
        snapshot.appendSections([0])
        snapshot.appendItems(items)
        dataSource.apply(snapshot)
    }
}
