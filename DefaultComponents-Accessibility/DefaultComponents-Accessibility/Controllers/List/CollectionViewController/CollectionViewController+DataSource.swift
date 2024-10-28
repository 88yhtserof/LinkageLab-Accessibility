//
//  CollectionViewController+DataSource.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 9/23/24.
//

import UIKit

//MARK: DataSource
extension CollectionViewController {
    typealias DataSource = UICollectionViewDiffableDataSource<Section, Item>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Item>
    
    func pagableCellRegistrationHandler(cell: GridTextCell, indexPath: IndexPath, item: String) {
        cell.text = item
        cell.selectedBackgroundView = UIView()
    }
    
    func listTypesCellRegistrationHandler(cell: UICollectionViewListCell, indexPath: IndexPath, item: String) {
        var configuration = UIListContentConfiguration.valueCell()
        configuration.text = item
        cell.contentConfiguration = configuration
        cell.selectedBackgroundView = UIView()
    }
    
    func supplementaryRegistrationHandler(supplementaryView: TitleSupplementaryView, string: String, indexPath: IndexPath) {
        let title = snapshot.sectionIdentifiers[indexPath.section].title
        supplementaryView.title = title
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
