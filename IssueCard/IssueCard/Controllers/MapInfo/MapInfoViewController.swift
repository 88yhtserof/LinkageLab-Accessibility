//
//  MapInfoViewController.swift
//  IssueCard
//
//  Created by 링키지랩 on 10/15/24.
//

import UIKit

final class MapInfoViewController: DefaultViewController {

    var dataSource: DataSource!
    var mapInfos = MapInfo.samples
    
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureConstsraints()
    }
}

private extension MapInfoViewController {
    func configureView() {
        collectionView.isScrollEnabled = false
        let cellRegistration = UICollectionView.CellRegistration(handler: cellRegistrationHandler)
        
        dataSource = DataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
        })
        
        updateSnapshot()
        collectionView.dataSource = dataSource
    }
    
    func configureConstsraints() {
        view.addPinnedSubview(collectionView, height: nil)
    }
    
    func layout() -> UICollectionViewLayout {
        let config = UICollectionLayoutListConfiguration(appearance: .plain)
        return UICollectionViewCompositionalLayout.list(using: config)
    }
}

