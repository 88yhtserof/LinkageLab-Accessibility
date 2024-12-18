//
//  SearchViewController.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 9/19/24.
//

import UIKit

final class SearchViewController: DefaultViewController {
    
    var dataSource: DataSource!
    var snapshot: Snapshot!
    let samples = Book.samples
    
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: configureLayout())
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
extension SearchViewController {
    
    func configureSubviews() {
        collectionView.collectionViewLayout = configureLayout()
        
        let cellRegistration = UICollectionView.CellRegistration(handler: cellRegistrationHandler)
        
        dataSource = DataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
        })
        
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
        view.addPinnedSubview(collectionView, height: nil)
    }
    
    func configureLayout() -> UICollectionViewLayout {
        let configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        return UICollectionViewCompositionalLayout.list(using: configuration)
    }
}
