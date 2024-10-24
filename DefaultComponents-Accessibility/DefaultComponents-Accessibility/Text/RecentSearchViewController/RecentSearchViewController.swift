//
//  RecentSearchViewController.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 10/23/24.
//

import UIKit

final class RecentSearchViewController: DefaultViewController {
    
    var dataSource: DataSource!
    var snapshot: Snapshot!
    let samples = Book.samples
    let recents = ["하퍼", "올리", "하니", "아일라", "이든", "아마라", "칸", "아주 긴 닉네임을 테스트 합니다"]
    
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout())
    private lazy var searchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isSettingFocus = false
        configureSubviews()
        configureView()
        configureConstraints()
    }
}

// MARK: Configuration
extension RecentSearchViewController {
    
    func configureSubviews() {
        collectionView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
        
        let recentCellRegistration = UICollectionView.CellRegistration(handler: recentCellRegistrationHandler)
        let resultCellRegistration = UICollectionView.CellRegistration(handler: resultCellRegistrationHandler)
        
        dataSource = DataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            guard let section = Section(rawValue: indexPath.section) else {
                fatalError("Unknown Error")
            }
            switch section {
            case .recent:
                return collectionView.dequeueConfiguredReusableCell(using: recentCellRegistration, for: indexPath, item: itemIdentifier.recent)
            case .result:
                return collectionView.dequeueConfiguredReusableCell(using: resultCellRegistration, for: indexPath, item: itemIdentifier.result)
            }
        })
        
        let titleSupplementaryRegistration = UICollectionView.SupplementaryRegistration(elementKind: "title-element-kind", handler: titleSupplementaryRegistrationHandler)
        dataSource.supplementaryViewProvider = { collectionView, kind, indexPath in
            return collectionView.dequeueConfiguredReusableSupplementary(using: titleSupplementaryRegistration, for: indexPath)
            
        }
        
        initialSnapshot()
        collectionView.dataSource = dataSource
    }
    
    func configureView() {
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "책 제목을 입력하세요"
    }
    
    func configureConstraints() {
        [ collectionView ]
            .forEach{
                $0.translatesAutoresizingMaskIntoConstraints = false
                view.addSubview($0)
            }
        
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor)
        ])
    }
}
