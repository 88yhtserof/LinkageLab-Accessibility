//
//  TableWithAccessibilityViewController+DataSource.swift
//  DefaultComponents-Accessibility
//
//  Created by 임윤휘 on 10/20/24.
//

import UIKit

extension TableWithAccessibilityViewController {
    typealias DataSource = UITableViewDiffableDataSource<Int, Book>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Int, Book>
    
    func createSnapshot() {
        self.snapshot = Snapshot()
        snapshot.appendSections([0])
        snapshot.appendItems(books)
        dataSource.apply(snapshot)
    }
    
    func deleteSnapshot(at item: Book) {
        snapshot.deleteItems([item])
        dataSource.apply(snapshot)
    }
    
    func reconfigureSnapshot(at item: Book) {
        snapshot.reconfigureItems([item])
        dataSource.apply(snapshot)
    }
}
