//
//  OutlineViewController.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 9/11/24.
//

import UIKit

final class OutlineViewController: DefaultViewController {
    
    var dataSource: DataSource!
    var snapshot: Snapshot!
    var sections = Outline.sections
    var items = Detail.items
    
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSubViews()
        configureConstraints()
    }
}

// MARK: Configuration
private extension OutlineViewController {
    func configureSubViews() {
        collectionView.delegate = self
        
        let headerRegistration = UICollectionView.CellRegistration(handler: headerRegistrationHandler)
        let cellRegistraion = UICollectionView.CellRegistration(handler: cellRegistrationHandler)
        
        dataSource = DataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier -> UICollectionViewCell in
            if indexPath.item == 0 {
                return collectionView.dequeueConfiguredReusableCell(using: headerRegistration, for: indexPath, item: itemIdentifier)
            } else {
                return collectionView.dequeueConfiguredReusableCell(using: cellRegistraion, for: indexPath, item: itemIdentifier)
            }
        })
        
        updateSnapshot()
        collectionView.dataSource = dataSource
    }
    
    func configureConstraints() {
        view.addPinnedSubview(collectionView, height: nil)
    }
}

// MARK: CollectionView Layout
private extension OutlineViewController {
    func layout() -> UICollectionViewLayout {
        var configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        return UICollectionViewCompositionalLayout.list(using: configuration)
    }
}
