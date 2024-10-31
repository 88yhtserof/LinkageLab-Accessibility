//
//  ArtistChannelViewController.swift
//  IssueCard
//
//  Created by 링키지랩 on 10/29/24.
//

import UIKit

final class ArtistChannelViewController: DefaultAccessibilityViewController {
    
    var dataSource: DataSource!
    var snapshot: Snapshot!
    var books = Music.samples
    
    lazy var artistBackgroundImageView = ArtistBackgroundImageView()
    lazy var gradientBackgroundView = GradientTopBackgroundView()
    lazy var artistInfoView = ArtistInfoView()
    
    lazy var rightBarButton: UIBarButtonItem = {
        var view = UIBarButtonItem()
        view.image = UIImage(systemName: "ellipsis")
        return view
    }()
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout())
    lazy var miniPlayerView = MiniPlayerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        configureConstraints()
        configureDataSource()
    }
}

private extension ArtistChannelViewController {
    
    func configureView() {
        let miniPlayerHeight = miniPlayerView.frame.height
        collectionView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: miniPlayerHeight, right: -10)
        
        navigationItem.rightBarButtonItem = rightBarButton
    }
    
    func configureConstraints() {
        view.addPinnedSubview(collectionView, height: nil, equalTo: .init(top: .view, leading: .view, bottom: .view, trailing: .view))
        view.addSubviews([miniPlayerView])
        
        NSLayoutConstraint.activate([
            miniPlayerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            miniPlayerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            miniPlayerView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func configureDataSource() {
        let latestCellRegistration = UICollectionView.CellRegistration(handler: latestCellRegistrationHandler)
        let chartCellRegistration = UICollectionView.CellRegistration(handler: chartCellRegistrationHandler)
        let customCellRegistration = UICollectionView.CellRegistration(handler: todayCellRegistrationHandler)
        
        dataSource = DataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            guard let section = Section(rawValue: indexPath.section) else {
                fatalError("Unknown section")
            }
            switch section {
            case .latest:
                return collectionView.dequeueConfiguredReusableCell(using: latestCellRegistration, for: indexPath, item: itemIdentifier)
            case .chart:
                return collectionView.dequeueConfiguredReusableCell(using: chartCellRegistration, for: indexPath, item: itemIdentifier)
            case .today:
                return collectionView.dequeueConfiguredReusableCell(using: customCellRegistration, for: indexPath, item: itemIdentifier)
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
