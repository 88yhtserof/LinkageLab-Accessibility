//
//  NewsListViewControllerWithAccessibility+DataSource.swift
//  DefaultComponents-Accessibility
//
//  Created by 임윤휘 on 10/18/24.
//

import UIKit

extension NewsListViewControllerWithAccessibility {
    typealias DataSource = UITableViewDiffableDataSource<Int, News>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Int, News>
    
    func initializeSnapshot() {
        pagable = Pagable(total: news.count, start: 0, display: 3, lastIndex: news.count - 1)
        snapshot = Snapshot()
        snapshot.appendSections([0])
        snapshot.appendItems(news)
        dataSource.apply(snapshot)
    }
    
    func updateSnapshot(newItems items: [News], after index: Int) {
        pagable.total = pagable.total + items.count
        pagable.start = news.count
        pagable.lastIndex = pagable.total - 1
        snapshot.insertItems(items, afterItem: news[index])
        news.append(contentsOf: items)
        
        dataSource.apply(snapshot)
        
        let indexPath = IndexPath(item: index + 1, section: 0)
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        Task {
            try? await UIAccessibility.setFocus(to: cell, for: .seconds(1.5))
        }
    }
}
