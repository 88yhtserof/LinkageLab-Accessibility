//
//  OutLineViewController+DataSource.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 9/11/24.
//

import UIKit

// MARK: DataSource
extension OutLineViewController {
    typealias DataSource = UICollectionViewDiffableDataSource<Int, OutLine>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Int, OutLine>
    
    func cellRegistrationHandler(cell: UICollectionViewListCell, indexPath: IndexPath, item: OutLine) {
        var configuration = cell.defaultContentConfiguration()
        configuration.text = item.title
        cell.contentConfiguration = configuration
    }
    
    func updateSnapshot() {
        var snapshot = Snapshot()
        snapshot.appendSections([0])
        snapshot.appendItems(self.outlines)
        dataSource.apply(snapshot)
    }
}
