//
//  CollectionWithAccessibilityViewController+DataSource.swift
//  DefaultComponents-Accessibility
//
//  Created by 임윤휘 on 10/20/24.
//

import UIKit

//MARK: DataSource
extension CollectionWithAccessibilityViewController {
    typealias DataSource = UICollectionViewDiffableDataSource<Section, Item>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Item>
    
    func pagableCellRegistrationHandler(cell: GridTextCellWithAccessibility, indexPath: IndexPath, item: String) {
        cell.text = item
        cell.selectedBackgroundView = UIView()
        if UIAccessibility.isVoiceOverRunning {
            cell.isAccessibilityElement = true
            cell.accessibilityLabel = item
        }
    }
    
    func listTypesCellRegistrationHandler(cell: ButtonTraitsCollectionListCell, indexPath: IndexPath, item: String) {
        var configuration = UIListContentConfiguration.valueCell()
        configuration.text = item
        cell.contentConfiguration = configuration
        cell.selectedBackgroundView = UIView()
    }
    
    func supplementaryRegistrationHandler(supplementaryView: TitleSupplementaryView, string: String, indexPath: IndexPath) {
        let title = snapshot.sectionIdentifiers[indexPath.section].title
        supplementaryView.title = title
        if UIAccessibility.isVoiceOverRunning {
            supplementaryView.isAccessibilityElement = true
            supplementaryView.accessibilityLabel = title
            supplementaryView.accessibilityTraits = .header
        }
    }
    
    func updateSnapshot() {
        let pagableItems = outlines.map{ Item(pagable: $0.title) }
        let listItems = outlines.map{ Item(list: $0.title) }
        
        snapshot = Snapshot()
        snapshot.appendSections([.pagable, .list])
        snapshot.appendItems(pagableItems, toSection: .pagable)
        snapshot.appendItems(listItems, toSection: .list)
        dataSouce.apply(snapshot)
    }
}
