//
//  RecentSearchWithAccessibilityViewController.swift
//  DefaultComponents-Accessibility
//
//  Created by 임윤휘 on 10/25/24.
//

import UIKit

final class RecentSearchWithAccessibilityViewController: DefaultViewController {
    
    let headerSupplementaryKind = "title-element-kind"
    
    var dataSource: DataSource!
    var snapshot: Snapshot!
    let allUsers = UserInfo.samples
    var recents = UserInfo.recents {
        didSet {
            accessibilityValueForRecentSupplementary()
        }
    }
    
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout())
    lazy var searchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSubviews()
        configureView()
        configureConstraints()
    }
}

// MARK: Configuration
extension RecentSearchWithAccessibilityViewController {
    
    func configureSubviews() {
        collectionView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
        
        let recentCellRegistration = UICollectionView.CellRegistration(handler: recentCellRegistrationHandler)
        let recentEmptyCellRegistration = UICollectionView.CellRegistration(handler: recentEmptyCellRegistrationHandler)
        let resultCellRegistration = UICollectionView.CellRegistration(handler: resultCellRegistrationHandler)
        
        dataSource = DataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            guard let section = Section(rawValue: indexPath.section) else {
                fatalError("Unknown Error")
            }
            switch section {
            case .recent:
                if let recent = itemIdentifier.recent {
                    return collectionView.dequeueConfiguredReusableCell(using: recentCellRegistration, for: indexPath, item: recent)
                } else {
                    return collectionView.dequeueConfiguredReusableCell(using: recentEmptyCellRegistration, for: indexPath, item: Item())
                }
            case .result:
                guard let userInfo = itemIdentifier.result else { return UICollectionViewCell() }
                return collectionView.dequeueConfiguredReusableCell(using: resultCellRegistration, for: indexPath, item: userInfo)
            }
        })
        
        let titleSupplementaryRegistration = UICollectionView.SupplementaryRegistration(elementKind: headerSupplementaryKind, handler: titleSupplementaryRegistrationHandler)
        dataSource.supplementaryViewProvider = { collectionView, kind, indexPath in
            return collectionView.dequeueConfiguredReusableSupplementary(using: titleSupplementaryRegistration, for: indexPath)
        }
        
        initialSnapshot()
        collectionView.dataSource = dataSource
    }
    
    func accessibilityValueForRecentSupplementary() {
        guard let supplementaryView = collectionView.supplementaryView(forElementKind: headerSupplementaryKind, at: IndexPath(item: 0, section: 0)) as? TitleSupplementaryView else { return }
        supplementaryView.accessibilityValue = "\(self.recents.count)개의 검색어"
    }
    
    func configureView() {
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "닉네임을 입력하세요"
    }
    
    func configureConstraints() {
        view.addPinnedSubview(collectionView, height: nil)
    }
}
