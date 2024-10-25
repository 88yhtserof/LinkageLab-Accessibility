//
//  RecentSearchViewController+DataSource.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 10/23/24.
//

import UIKit

extension RecentSearchViewController {
    typealias DataSource = UICollectionViewDiffableDataSource<Section, Item>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Item>
    
    func recentCellRegistrationHandler(cell: RecentListCell, indexPath: IndexPath, item: String) {
        cell.text = item
        cell.deleteAction = { [weak self]  in
            let itemToDelete = Item(recent: item)
            self?.updateSnapshotForRecent(itemToDelete: itemToDelete)
        }
        cell.textAction = { [weak self] searchWord in
            self?.searchController.searchBar.text = searchWord
        }
    }
    
    func recentEmptyCellRegistrationHandler(cell: RecentEmptyListCell, indexPath: IndexPath, item: String) {
    }
    
    func resultCellRegistrationHandler(cell: UICollectionViewListCell, indexPath: IndexPath, item: String) {
        var configuration = UIListContentConfiguration.cell()
        configuration.text = item
        cell.contentConfiguration = configuration
        cell.selectedBackgroundView = UIView()
    }
    
    func titleSupplementaryRegistrationHandler(supplementaryView: TitleSupplementaryView, string: String, indexPath: IndexPath) {
        guard let section = Section(rawValue: indexPath.section) else {
            fatalError("Unknown Section")
        }
        supplementaryView.title = section.title
    }
    
    func initialSnapshot() {
        let recentItems = recents.isEmpty ? [Item()] : recents.map({ Item(recent: $0) })
        let resultItems = samples.map({ Item(result: $0.title) })
        
        snapshot = Snapshot()
        snapshot.appendSections([.recent, .result])
        snapshot.appendItems(recentItems, toSection: .recent)
        snapshot.appendItems(resultItems, toSection: .result)
        dataSource.apply(snapshot)
    }
    
    func updateSnapshotForRecent(itemToDelete item: Item) {
        guard let index = recents.firstIndex(of: item.recent!) else { return }
        recents.remove(at: index)
        snapshot.deleteItems([item])
        dataSource.apply(snapshot)
        
        if recents.isEmpty {
            emptySnapshotForRecent()
        }
    }
    
    func updateSnapshotForRecent(itemToAdd item: Item) {
        if let first = recents.first {
            let firstItem = Item(recent: first)
            snapshot.insertItems([item], beforeItem: firstItem)
        } else {
            let recentItems = snapshot.itemIdentifiers(inSection: .recent)
            snapshot.deleteItems(recentItems)
            snapshot.appendItems([item], toSection: .recent)
        }
        recents.insert(item.recent!, at: 0)
        dataSource.apply(snapshot)
    }
    
    func emptySnapshotForRecent() {
        snapshot.appendItems([Item()], toSection: .recent)
        dataSource.apply(snapshot)
    }
    
    func emptySnashotForResult() {
        let resultItems = snapshot.itemIdentifiers(inSection: .result)
        snapshot.deleteItems(resultItems)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
    
    func filteredSnapshot(searchWord word: String) {
        let resultItems = snapshot.itemIdentifiers(inSection: .result)
        let filteredItems = samples
            .map({ Item(result: $0.title) })
            .filter{ $0.result!.contains(word) }
        snapshot.deleteItems(resultItems)
        snapshot.appendItems(filteredItems, toSection: .result)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
}
