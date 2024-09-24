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
    
    func controlCellRegistrationHandler(cell: UICollectionViewListCell, indexPath: IndexPath, item: Item) {
        let toggle = UISwitch()
        toggle.isOn = true
        toggle.addTarget(self, action: #selector(didToggleSwitch), for: .valueChanged)
        
        var configuration = UIListContentConfiguration.cell()
        configuration.text = "활성화 버튼"
        cell.contentConfiguration = configuration
        cell.accessories = [.customView(configuration: .init(customView: toggle, placement: .trailing()))]
        cell.selectedBackgroundView = UIView()
    }
    
    func listCellRegistrationHandler(cell: UICollectionViewListCell, indexPath: IndexPath, item: Item) {
        var configuration = cell.defaultContentConfiguration()
        configuration.text = item.title
        cell.contentConfiguration = configuration
        cell.selectedBackgroundView = UIView()
    }
    
    func updateSnapshot() {
        let items = outlines.map{ Item(title: $0.title) }
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
