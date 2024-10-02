//
//  OutLineViewController+DataSource.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 9/11/24.
//

import UIKit

// MARK: DataSource
extension OutlineViewController {
    typealias DataSource = UICollectionViewDiffableDataSource<Outline, Detail>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Outline, Detail>
    typealias SectionSnapshot = NSDiffableDataSourceSectionSnapshot<Detail>
    
    func headerRegistrationHandler(cell: UICollectionViewListCell, indexPath: IndexPath, item: Detail) {
        var configuration = cell.defaultContentConfiguration()
        configuration.text = item.title
        cell.contentConfiguration = configuration
        cell.selectedBackgroundView = UIView()
        cell.accessories = [.outlineDisclosure()]
    }
    
    func cellRegistrationHandler(cell: UICollectionViewListCell, indexPath: IndexPath, item: Detail) {
        var configuration = cell.defaultContentConfiguration()
        configuration.text = item.title
        cell.contentConfiguration = configuration
        cell.selectedBackgroundView = UIView()
        cell.accessories = [.disclosureIndicator()]
    }
    
    func updateSnapshot() {
        var snapshot = Snapshot()
        snapshot.appendSections(sections)
        dataSource.apply(snapshot)
        
        for (offeset, section) in sections.enumerated() {
            var sectionSnapshot = SectionSnapshot()
            let headerItem = Detail(title: "\(section.title)")
            sectionSnapshot.append([headerItem])
            sectionSnapshot.append(items[offeset], to: headerItem)
            sectionSnapshot.expand([headerItem])
            dataSource.apply(sectionSnapshot, to: section)
        }
    }
}
