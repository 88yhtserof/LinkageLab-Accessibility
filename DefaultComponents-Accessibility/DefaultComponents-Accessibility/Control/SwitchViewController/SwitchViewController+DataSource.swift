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
        let isAccessibility: Bool?
        let title: String
        
        init(isAccessibility: Bool? = nil, title: String) {
            self.isAccessibility = isAccessibility
            self.title = title
        }
    }
    
    typealias DataSource = UICollectionViewDiffableDataSource<Section, Item>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Item>
    
    func controlCellRegistrationHandler(cell: AccessibilityListCell, indexPath: IndexPath, item: Item) {
        var configuration = UIListContentConfiguration.cell()
        configuration.text = item.title
        cell.contentConfiguration = configuration
        if (item.isAccessibility ?? false) {
            cell.isAccessibilityElement = true
            cell.accessories = [.customView(configuration: .init(customView: toggleAccessibility, placement: .trailing()))]
            cell.actionForAccessibility = didDoubleTapToSetWiFi
        } else {
            cell.accessories = [.customView(configuration: .init(customView: toggle, placement: .trailing()))]
        }
        cell.selectedBackgroundView = UIView()
        
    }
    
    func listCellRegistrationHandler(cell: UICollectionViewListCell, indexPath: IndexPath, item: Item) {
        var configuration = cell.defaultContentConfiguration()
        configuration.text = item.title
        cell.contentConfiguration = configuration
        cell.selectedBackgroundView = UIView()
    }
    
    func updateSnapshot() {
        let components = [Item(isAccessibility: false, title: "WiFi"), Item(isAccessibility: true, title: "WiFi for Accessibility")]
        let items = wifies.map{ Item(title: $0.title) }
        var snapshot = Snapshot()
        snapshot.appendSections([.control])
        snapshot.appendItems(components, toSection: .control)
        
        if isEnabled {
            snapshot.appendSections([.list])
            snapshot.appendItems(items, toSection: .list)
        }
        dataSource.apply(snapshot)
    }
}
