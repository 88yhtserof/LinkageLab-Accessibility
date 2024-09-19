//
//  OutLineViewController+DataSource.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 9/11/24.
//

import UIKit

// MARK: DataSource
extension OutlineViewController {
    typealias DataSource = UICollectionViewDiffableDataSource<Outline, Item>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Outline, Item>
    typealias SectionSnapshot = NSDiffableDataSourceSectionSnapshot<Item>
    
    func headerRegistrationHandler(cell: UICollectionViewListCell, indexPath: IndexPath, item: Item) {
        var configuration = cell.defaultContentConfiguration()
        configuration.text = item.title
        cell.contentConfiguration = configuration
        cell.selectedBackgroundView = UIView()
        cell.accessories = [.outlineDisclosure()]
    }
    
    func cellRegistrationHandler(cell: UICollectionViewListCell, indexPath: IndexPath, item: Item) {
        var configuration = cell.defaultContentConfiguration()
        configuration.text = item.title
        cell.contentConfiguration = configuration
        cell.selectedBackgroundView = UIView()
    }
    
    func updateSnapshot() {
        var snapshot = Snapshot()
        snapshot.appendSections(sections)
        dataSource.apply(snapshot)
        
        for (offeset, section) in sections.enumerated() {
            var sectionSnapshot = SectionSnapshot()
            let headerItem = Item(title: "\(section.title)")
            sectionSnapshot.append([headerItem])
            sectionSnapshot.append(items[offeset], to: headerItem)
            sectionSnapshot.expand([headerItem])
            dataSource.apply(sectionSnapshot, to: section)
        }
    }
}
