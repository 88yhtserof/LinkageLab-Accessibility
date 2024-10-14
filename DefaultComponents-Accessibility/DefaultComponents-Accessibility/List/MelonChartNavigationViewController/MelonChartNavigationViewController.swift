//
//  MelonChartNavigationViewController.swift
//  DefaultComponents-Accessibility
//
//  Created by 임윤휘 on 10/13/24.
//

import UIKit

final class MelonChartNavigationViewController: DefaultViewController {
    
    var dataSource: DataSource!
    var snapshot: Snapshot!
    var books = Book.samples
    
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout())
    
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        isSettingFocus = false
        
        configureSubviews()
        configureView()
        configureDataSource()
    }
}

// MARK: Configuration
private extension MelonChartNavigationViewController {
    func configureSubviews() {
        collectionView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 20, right: -10)
    }
    
    func configureView() {
        view.addPinnedSubview(collectionView, height: nil)
    }
    
    func configureDataSource() {
        let latestCellRegistration = UICollectionView.CellRegistration(handler: latestCellRegistrationHandler)
        let chartCellRegistration = UICollectionView.CellRegistration(handler: chartCellRegistrationHandler)
        
        dataSource = DataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            guard let section = Section(rawValue: indexPath.section) else {
                fatalError("Unknown section")
            }
            switch section {
            case .latest:
                return collectionView.dequeueConfiguredReusableCell(using: latestCellRegistration, for: indexPath, item: itemIdentifier.latest)
            case .chart:
                return collectionView.dequeueConfiguredReusableCell(using: chartCellRegistration, for: indexPath, item: itemIdentifier.chart)
            }
        })
        
        let supplementaryRegistration = UICollectionView.SupplementaryRegistration(elementKind: Supplementary.title
            .name, handler: supplementaryRegistrationHandler)
        dataSource.supplementaryViewProvider = { collectionView, kind, indexPath in
            return collectionView.dequeueConfiguredReusableSupplementary(using: supplementaryRegistration, for: indexPath)
        }
        
        updateSnapshot()
        collectionView.dataSource = dataSource
    }
}
