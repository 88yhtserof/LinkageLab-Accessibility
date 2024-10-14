//
//  InnerCollectionListCell.swift
//  DefaultComponents-Accessibility
//
//  Created by 임윤휘 on 10/14/24.
//

import UIKit

final class InnerCollectionListCell: UICollectionViewCell {
    
    var dataSource: UICollectionViewDiffableDataSource<Int, String>!
    var books = Book.samples
    
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureContentView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension InnerCollectionListCell {
    
    func configureContentView() {
        contentView.addPinnedSubview(collectionView, height: nil)
        
        let cellRegistration = UICollectionView.CellRegistration(handler: cellRegistrationHandler)
        
        dataSource = UICollectionViewDiffableDataSource<Int, String>(collectionView: collectionView) { collectionView,indexPath,itemIdentifier in
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
        }
        
        var snapshot = NSDiffableDataSourceSnapshot<Int, String>()
        snapshot.appendSections([0])
        snapshot.appendItems(books.map({$0.title}))
        dataSource.apply(snapshot)
        collectionView.dataSource = dataSource
    }
    
    func layout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.5))
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, repeatingSubitem: item, count: 2)
        group.interItemSpacing = .flexible(5)
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.interGroupSpacing = 10
        
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    func cellRegistrationHandler(cell: BorderedListCell, indexPath: IndexPath, item: String) {
        cell.rank = indexPath.item
        cell.text = item
    }
}
