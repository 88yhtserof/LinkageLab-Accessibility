//
//  SearchViewController+DataSource.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 9/19/24.
//

import UIKit

extension SearchViewController {
    typealias DataSource = UICollectionViewDiffableDataSource<Int, Book>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Int, Book>
    
    func cellRegistrationHandler(cell: UICollectionViewListCell, indexPath: IndexPath, item: Book) {
        var configuration = UIListContentConfiguration.cell()
        configuration.text = item.title
        cell.contentConfiguration = configuration
        cell.selectedBackgroundView = UIView()
    }
    
    func initialSnapshot() {
        snapshot = Snapshot()
        snapshot.appendSections([0])
        snapshot.appendItems(samples)
        dataSource.apply(snapshot)
    }
    
    func emptySnashot() {
        snapshot = Snapshot()
        snapshot.appendSections([0])
        snapshot.appendItems([])
        dataSource.apply(snapshot, animatingDifferences: true)
    }
    
    func filteredSnapshot(searchWord word: String) {
        let filteredItems = samples.filter{ $0.title.contains(word) }
        snapshot = Snapshot()
        snapshot.appendSections([0])
        snapshot.appendItems(filteredItems)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
}
