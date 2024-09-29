//
//  CollectionViewController.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 9/23/24.
//

import UIKit

final class CollectionViewController: DefaultViewController {
    
    var isAccessible: Bool
    var dataSouce: DataSource!
    var snapshot: Snapshot!
    var outlines = Outline.sections
    
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout())
    
    // MARK: Initialize
    init(isAccessible: Bool) {
        self.isAccessible = isAccessible
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSubviews()
        configureView()
        configureDataSource()
    }
}

// MARK: Configuration
private extension CollectionViewController {
    func configureSubviews() {
        collectionView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 20, right: -10)
    }
    
    func configureView() {
        view.addPinnedSubview(collectionView, height: nil)
    }
    
    func configureDataSource() {
        let myAlbumCellRegistration = UICollectionView.CellRegistration(handler: pagableCellRegistrationHandler)
        let mediaTypesCellRegistration = UICollectionView.CellRegistration(handler: listTypesCellRegistrationHandler)
        
        dataSouce = DataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            guard let section = Section(rawValue: indexPath.section) else {
                fatalError("Unknown section")
            }
            switch section {
            case .pagable:
                return collectionView.dequeueConfiguredReusableCell(using: myAlbumCellRegistration, for: indexPath, item: itemIdentifier.pagable)
            case .list:
                return collectionView.dequeueConfiguredReusableCell(using: mediaTypesCellRegistration, for: indexPath, item: itemIdentifier.list)
            }
        })
        
        let supplementaryRegistration = UICollectionView.SupplementaryRegistration(elementKind: Supplementary.title
            .name, handler: supplementaryRegistrationHandler)
        dataSouce.supplementaryViewProvider = { collectionView, kind, indexPath in
            return collectionView.dequeueConfiguredReusableSupplementary(using: supplementaryRegistration, for: indexPath)
        }
        
        updateSnapshot()
        collectionView.dataSource = dataSouce
    }
}
