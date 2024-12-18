//
//  ArtistChannelViewController.swift
//  IssueCard
//
//  Created by 링키지랩 on 10/29/24.
//

import UIKit

final class ArtistChannelViewController: DefaultViewController {
    
    var dataSource: DataSource!
    var snapshot: Snapshot!
    var books = Music.samples
    
    lazy var backButton = BackButton(of: self)
    lazy var artistBackgroundImageView = ArtistBackgroundImageView()
    lazy var gradientBackgroundView = GradientTopBackgroundView()
    lazy var artistInfoView = ArtistInfoView()
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout())
    lazy var miniPlayerView = MiniPlayerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        configureConstraints()
        configureDataSource()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
}

private extension ArtistChannelViewController {
    
    func configureView() {
        let miniPlayerHeight = miniPlayerView.frame.height
        collectionView.contentInset = UIEdgeInsets(top: 80, left: 10, bottom: miniPlayerHeight, right: -10)
    }
    
    func configureConstraints() {
        view.addPinnedSubview(collectionView, height: nil, equalTo: .init(top: .view, leading: .view, bottom: .view, trailing: .view))
        view.addSubviews([backButton, miniPlayerView,])
        
        let ratio = artistBackgroundImageView.frame.size.width / artistBackgroundImageView.frame.size.height
        
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            
            miniPlayerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            miniPlayerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            miniPlayerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
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
