//
//  TodayCollectionListCell.swift
//  IssueCard
//
//  Created by 링키지랩 on 10/30/24.
//

import UIKit

final class TodayCollectionListCell: UICollectionViewCell {
    
    var dataSource: UICollectionViewDiffableDataSource<Int, String>!
    var books = Music.samples
    var currentPage = 0
    
    weak var delegate: AdjustableForAccessibility?
    private var currentPageOfCustom = 0
    
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureContentView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func accessibilityIncrement() {
        delegate?.adjustableIncrement(self)
        
    }
    
    override func accessibilityDecrement() {
        delegate?.adjustableDecrement(self)
    }
}

private extension TodayCollectionListCell {
    
    func configureContentView() {
        let cellRegistration = UICollectionView.CellRegistration(handler: cellRegistrationHandler)
        
        dataSource = UICollectionViewDiffableDataSource<Int, String>(collectionView: collectionView) { collectionView,indexPath,itemIdentifier in
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
        }
        
        var snapshot = NSDiffableDataSourceSnapshot<Int, String>()
        snapshot.appendSections([0])
        snapshot.appendItems(books.map({$0.title}))
        dataSource.apply(snapshot)
        collectionView.dataSource = dataSource
        
        contentView.addPinnedSubview(collectionView, height: nil)
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
        cell.rank = indexPath.item + 1
        cell.text = item
    }
    
    func configureAccessibilityValue(current index: Int) {
        let label = books[index].title
        let value = "총 \(books.count) 페이지 중 \(index + 1) 페이지"
        let descriptions = [label, value]
        collectionView.accessibilityValue = descriptions.compactMap({ $0 }).joined(separator: ", ")
    }
}
