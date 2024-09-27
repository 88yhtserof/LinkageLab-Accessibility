//
//  SwitchViewController+DataSource.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 9/20/24.
//

import UIKit

// MARK: DataSource
extension SwitchViewController {
    
    enum Section: Int {
        case control, list
    }
    
    struct Item: Hashable {
        let isEnabled: Bool?
        let title: String?
        
        init(isEnabled: Bool? = nil, title: String? = nil) {
            self.isEnabled = isEnabled
            self.title = title
        }
    }
    
    typealias DataSource = UICollectionViewDiffableDataSource<Section, Item>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Item>
    
    func controlCellRegistrationHandler(cell: AccessibilityListCell, indexPath: IndexPath, item: Item) {
        
        var configuration = UIListContentConfiguration.cell()
        configuration.text = "Wi-Fi"
        cell.contentConfiguration = configuration
        cell.accessories = [.customView(configuration: .init(customView: toggle, placement: .trailing()))]
        cell.selectedBackgroundView = UIView()
        cell.actionForAccessibility = didDoubleTapToSetWiFi
        
    }
    
    func listCellRegistrationHandler(cell: UICollectionViewListCell, indexPath: IndexPath, item: Item) {
        var configuration = cell.defaultContentConfiguration()
        configuration.text = item.title
        cell.contentConfiguration = configuration
        cell.selectedBackgroundView = UIView()
    }
    
    func updateSnapshot() {
        let items = wifies.map{ Item(title: $0.title) }
        var snapshot = Snapshot()
        snapshot.appendSections([.control])
        snapshot.appendItems([Item(isEnabled: true)], toSection: .control)
        
        if isEnabled {
            snapshot.appendSections([.list])
            snapshot.appendItems(items, toSection: .list)
        }
        dataSource.apply(snapshot)
    }
}
