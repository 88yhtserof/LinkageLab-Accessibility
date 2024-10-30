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
    
    lazy var scrollView = ScrollView()
    lazy var artistBackgroundImageView = ArtistBackgroundImageView()
    lazy var gradientBackgroundView = GradientTopBackgroundView()
    lazy var artistInfoView = ArtistInfoView()
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        configureConstraints()
        configureDataSource()
    }
}

private extension ArtistChannelViewController {
    
    func configureView() {
        collectionView.isScrollEnabled = false
    }
    
    func configureConstraints() {
        scrollView.contentView.addSubviews([artistBackgroundImageView, gradientBackgroundView, artistInfoView, collectionView])
        
        view.addPinnedSubview(scrollView, height: nil, equalTo: .init(top: .view, leading: .view, bottom: .view, trailing: .view))
        
        let ratio = artistBackgroundImageView.frame.size.width / artistBackgroundImageView.frame.size.height
        let horizontalInset = CGFloat(15)
        
        NSLayoutConstraint.activate([
            artistBackgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            artistBackgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            artistBackgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            artistBackgroundImageView.heightAnchor.constraint(equalTo: artistBackgroundImageView.widthAnchor, multiplier: ratio),
            
            gradientBackgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            gradientBackgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            gradientBackgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            gradientBackgroundView.topAnchor.constraint(equalTo: artistBackgroundImageView.topAnchor),
            
            artistInfoView.topAnchor.constraint(equalTo: scrollView.contentView.topAnchor, constant: 250),
            artistInfoView.leadingAnchor.constraint(equalTo: scrollView.contentView.leadingAnchor, constant: horizontalInset),
            artistInfoView.trailingAnchor.constraint(equalTo: scrollView.contentView.trailingAnchor, constant: horizontalInset),
            
            collectionView.topAnchor.constraint(equalTo: artistInfoView.topAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: scrollView.contentView.leadingAnchor, constant: horizontalInset),
            collectionView.trailingAnchor.constraint(equalTo: scrollView.contentView.trailingAnchor, constant: horizontalInset),
            collectionView.bottomAnchor.constraint(equalTo: scrollView.contentView.bottomAnchor, constant: 0)
        ])
    }
    
    func configureDataSource() {
        print("configureDataSource")
        let latestCellRegistration = UICollectionView.CellRegistration(handler: latestCellRegistrationHandler)
        let chartCellRegistration = UICollectionView.CellRegistration(handler: chartCellRegistrationHandler)
        let customCellRegistration = UICollectionView.CellRegistration(handler: todayCellRegistrationHandler)
        
        dataSource = DataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            print("section")
            guard let section = Section(rawValue: indexPath.section) else {
                fatalError("Unknown section")
            }
            print("@@@")
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
