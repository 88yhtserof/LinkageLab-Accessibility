//
//  RecentSearchWithAccessibilityViewController+DataSource.swift
//  DefaultComponents-Accessibility
//
//  Created by 임윤휘 on 10/25/24.
//

import UIKit

extension RecentSearchWithAccessibilityViewController {
    typealias DataSource = UICollectionViewDiffableDataSource<Section, Item>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Item>
    
    func recentCellRegistrationHandler(cell: RecentListCellWithAccessibility, indexPath: IndexPath, item: UserInfo) {
        cell.text = item.nickname
        cell.deleteAction = { [weak self]  in
            let itemToDelete = Item(recent: item)
            self?.updateSnapshotForRecent(itemToDelete: itemToDelete)
        }
        cell.textAction = { [weak self] searchWord in
            self?.searchController.searchBar.text = searchWord
        }
    }
    
    func recentEmptyCellRegistrationHandler(cell: RecentEmptyListCell, indexPath: IndexPath, item: Item) {
    }
    
    func resultCellRegistrationHandler(cell: ButtonTraitsCollectionListCell, indexPath: IndexPath, item: UserInfo) {
        var configuration = UIListContentConfiguration.cell()
        configuration.text = item.nickname
        cell.contentConfiguration = configuration
        cell.selectedBackgroundView = UIView()
        cell.accessibilityLabel = item.nickname
    }
    
    func titleSupplementaryRegistrationHandler(supplementaryView: TitleSupplementaryView, string: String, indexPath: IndexPath) {
        guard let section = Section(rawValue: indexPath.section) else {
            fatalError("Unknown Section")
        }
        supplementaryView.title = section.title
    }
    
    func initialSnapshot() {
        let recentItems = recents.isEmpty ? [Item()] : recents.map({ Item(recent: $0) })
        let resultItems = allUsers.map({ Item(result: $0) })
        
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
        accessibilityAnnounceRecent(for: item)
        
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
        let filteredItems = allUsers
            .map({ Item(result: $0) })
            .filter{ $0.result!.nickname.contains(word) }
        snapshot.deleteItems(resultItems)
        snapshot.appendItems(filteredItems, toSection: .result)
        dataSource.apply(snapshot, animatingDifferences: true)
        
        accessibilityAnnounceSearchResult(for: filteredItems)
    }
    
    func accessibilityAnnounceSearchResult(for list: [Item]) {
        if UIAccessibility.isVoiceOverRunning {
            let annuouncement = "\(list.count)개 검색 결과 제안됨"
            Task {
                await UIAccessibility.announceString(for: annuouncement)
            }
        }
    }
    
    func accessibilityAnnounceRecent(for item: Item) {
        guard UIAccessibility.isVoiceOverRunning,
              let nickname = item.recent?.nickname else { return }
        let announcement = "\(nickname) 제거됨"
        
        Task {
            await UIAccessibility.announceString(for: announcement)
        }
    }
}
