//
//  TableViewController+DataSource.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 9/23/24.
//

import UIKit

extension TableViewController {
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
