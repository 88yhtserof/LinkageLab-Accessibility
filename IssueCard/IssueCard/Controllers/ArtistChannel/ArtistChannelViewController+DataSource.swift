//
//  ArtistChannelViewController+DataSource.swift
//  IssueCard
//
//  Created by 링키지랩 on 10/30/24.
//

import UIKit

extension ArtistChannelViewController {
    typealias DataSource = UICollectionViewDiffableDataSource<Section, Item>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Item>
    
    func latestCellRegistrationHandler(cell: LatestCollectionListCell, indexPath: IndexPath, item: Item) {
        print("@@@")
        cell.delegate = self
        cell.isAccessibilityElement = true
        cell.accessibilityTraits = [.button, .adjustable]
        cell.accessibilityLabel = books[cell.currentPage].title
        cell.accessibilityValue = "총 \(books.count) 페이지 중 \(cell.currentPage + 1) 페이지"
        cell.presenting = self
    }
    
    func chartCellRegistrationHandler(cell: ChartCollectionListCell, indexPath: IndexPath, item: Item) {
        cell.delegate = self
        cell.isAccessibilityElement = true
        cell.accessibilityTraits = [.button, .adjustable]
        cell.accessibilityLabel = "\(cell.currentPage + 1)위, \(books[cell.currentPage].title)"
        cell.accessibilityValue = "총 \(books.count) 페이지 중 \(cell.currentPage + 1) 페이지"
    }
    
    func todayCellRegistrationHandler(cell: TodayCollectionListCell, indexPath: IndexPath, item: Item) {
        cell.delegate = self
        cell.isAccessibilityElement = true
        cell.accessibilityTraits = [.button, .adjustable]
        cell.accessibilityLabel = "\(cell.currentPage + 1)위, \(books[cell.currentPage].title)"
        cell.accessibilityValue = "총 \(books.count) 페이지 중 \(cell.currentPage + 1) 페이지"
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
        print("updateSnapshot")
        snapshot = Snapshot()
        snapshot.appendSections([.latest, .chart, .today])
        snapshot.appendItems([.latest], toSection: .latest)
        snapshot.appendItems([.chart], toSection: .chart)
        snapshot.appendItems([.today], toSection: .today)
        print(snapshot.itemIdentifiers)
        dataSource.apply(snapshot)
    }
    
}
