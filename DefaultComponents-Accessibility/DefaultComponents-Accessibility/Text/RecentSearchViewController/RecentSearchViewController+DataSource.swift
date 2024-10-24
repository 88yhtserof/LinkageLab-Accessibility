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
    
    func recentCellRegistrationHandler(cell: RecentListCell, indexPath: IndexPath, item: String?) {
        cell.text = item ?? ""
    }
    
    func resultCellRegistrationHandler(cell: UICollectionViewListCell, indexPath: IndexPath, item: String?) {
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
        let recentItems = recents.map({ Item(recent: $0) })
        let resultItems = samples.map({ Item(result: $0.title) })
        
        snapshot = Snapshot()
        snapshot.appendSections([.recent, .result])
        snapshot.appendItems(recentItems, toSection: .recent)
        snapshot.appendItems(resultItems, toSection: .result)
        dataSource.apply(snapshot)
    }
    
    func emptySnashot() {
        snapshot = Snapshot()
        snapshot.appendSections([.recent, .result])
        snapshot.appendItems([])
        dataSource.apply(snapshot, animatingDifferences: true)
    }
    
    func filteredSnapshot(searchWord word: String) {
        let recentItems = recents.map({ Item(recent: $0) })
        let filteredItems = samples
            .map({ Item(result: $0.title) })
            .filter{ $0.result!.contains(word) }
        snapshot = Snapshot()
        snapshot.appendSections([.recent, .result])
        snapshot.appendItems(recentItems, toSection: .recent)
        snapshot.appendItems(filteredItems, toSection: .result)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
}
