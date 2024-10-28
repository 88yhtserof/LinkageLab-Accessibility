//
//  SearchViewControllerWithAccessibility+DataSource.swift
//  DefaultComponents-Accessibility
//
//  Created by 임윤휘 on 10/6/24.
//

import UIKit

extension SearchViewControllerWithAccessibility {
    typealias DataSource = UICollectionViewDiffableDataSource<Int, Book>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Int, Book>
    
    func cellRegistrationHandler(cell: ButtonTraitsCollectionListCell, indexPath: IndexPath, item: Book) {
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
        
        accessibilityAnnounceSearchResult(for: samples)
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
        
        accessibilityAnnounceSearchResult(for: filteredItems)
    }
    
    func accessibilityAnnounceSearchResult(for list: [Book]) {
        if UIAccessibility.isVoiceOverRunning {
            let annuouncement = "\(list.count)개 검색 결과 제안됨"
            UIAccessibility.post(notification: .announcement, argument: annuouncement)
        }
    }
}
