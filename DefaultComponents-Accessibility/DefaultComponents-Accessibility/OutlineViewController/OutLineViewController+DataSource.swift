//
//  OutLineViewController+DataSource.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 9/11/24.
//

import UIKit

// MARK: DataSource
extension OutlineViewController {
    typealias DataSource = UICollectionViewDiffableDataSource<Int, Outline>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Int, Outline>
    
    func cellRegistrationHandler(cell: UICollectionViewListCell, indexPath: IndexPath, item: Outline) {
        var configuration = cell.defaultContentConfiguration()
        configuration.text = item.title
        cell.contentConfiguration = configuration
        cell.selectedBackgroundView = UIView()
    }
    
    func updateSnapshot() {
        var snapshot = Snapshot()
        snapshot.appendSections([0])
        snapshot.appendItems(self.outlines)
        dataSource.apply(snapshot)
    }
}
