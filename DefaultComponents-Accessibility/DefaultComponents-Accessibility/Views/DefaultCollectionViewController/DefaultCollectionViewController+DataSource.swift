//
//  DefaultCollectionViewController+DataSource.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 10/2/24.
//

import UIKit

//MARK: DataSource
extension DefaultCollectionViewController {
    typealias DataSource = UICollectionViewDiffableDataSource<String, Item>
    typealias Snapshot = NSDiffableDataSourceSnapshot<String, Item>
    
    func cellRegistrationHandler(cell: DefaultListCell, indexPath: IndexPath, item: Item) {
        cell.id = item.id
        guard cell.id == item.id else { return }
        cell.titleLabel.text = item.title
        cell.subtitleLabel.text = item.description
        cell.selectedBackgroundView = UIView()
        cell.view.addSubview(item.view)
        cell.tagLabel.text = item.tag.rawValue
        item.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            item.view.topAnchor.constraint(equalTo: cell.view.topAnchor),
            item.view.leadingAnchor.constraint(equalTo: cell.view.leadingAnchor),
            item.view.trailingAnchor.constraint(equalTo: cell.view.trailingAnchor),
            item.view.bottomAnchor.constraint(equalTo: cell.view.bottomAnchor)
        ])
    }
    
    func supplementaryRegistrationHandler(supplementaryView: TitleSupplementaryView, string: String, indexPath: IndexPath) {
        guard let sections else { return }
        let title = sections[indexPath.section]
        supplementaryView.title = title
        if isAccessible {
            supplementaryView.isAccessibilityElement = true
            supplementaryView.accessibilityLabel = title
            supplementaryView.accessibilityTraits = .header
        }
    }
    
    func updateSnapshot() {
        guard let sections, let items else { return }
        var itemsSeparated: [[Item]] = Array(repeating: [], count: sections.count)
        for item in items {
            itemsSeparated[item.sectionID].append(item)
        }
        
        snapshot = Snapshot()
        snapshot.appendSections(sections)
        for (i, items) in itemsSeparated.enumerated() {
            snapshot.appendItems(items, toSection: sections[i])
        }
        dataSouce.apply(snapshot)
    }
}
