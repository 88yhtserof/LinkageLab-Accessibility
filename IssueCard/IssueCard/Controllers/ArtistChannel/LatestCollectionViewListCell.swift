//
//  LatestCollectionViewListCell.swift
//  IssueCard
//
//  Created by 링키지랩 on 10/30/24.
//

import UIKit

final class LatestCollectionListCell: UICollectionViewCell {
    
    var dataSource: UICollectionViewDiffableDataSource<Int, String>!
    var books = Music.samples
    var currentPage = 0
    var presenting: UIViewController?
    
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
    
    override var accessibilityHint: String? {
        get {
            "동작을 활성화 할 수 있습니다."
        }
        set {}
    }
    
    override func accessibilityIncrement() {
        delegate?.adjustableIncrement(self)
        
    }
    
    override func accessibilityDecrement() {
        delegate?.adjustableDecrement(self)
    }
    
    override var accessibilityCustomActions: [UIAccessibilityCustomAction]? {
        get {
             return [ accessibilityActionForPresentingDeteil(), accessibilityActionForPlay() ]
        }
        set {}
    }
    
    func accessibilityActionForPresentingDeteil() -> UIAccessibilityCustomAction {
        return UIAccessibilityCustomAction(name: "상세 보기", target: self, selector: #selector(didTapMusicGroup))
    }
    
    func accessibilityActionForPlay() -> UIAccessibilityCustomAction {
        return UIAccessibilityCustomAction(name: "음악 재생") { _ in
            let selectedIndexPath = IndexPath(item: self.currentPage, section: 0)
            guard let cell = self.collectionView.cellForItem(at: selectedIndexPath) as? ArtistChannelListCell else { return false }
            cell.playButton.sendActions(for: .touchUpInside)
            return true
        }
    }
    
    @objc func didTapPlayButton(_ sender: UIButton) {
        let title = books[sender.tag].title
        let alert = UIAlertController(title: "음악 재생", message: "\"\(title)\"을 재생하시겠습니까?", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "취소", style: .cancel)
        let okAction = UIAlertAction(title: "확인", style: .default)
        [ cancelAction, okAction ]
            .forEach{ alert.addAction($0) }
        presenting?.present(alert, animated: true)
    }
    
    @objc func didTapMusicGroup() {
//        let vc = TableViewController()
//        presenting?.navigationController?.pushViewController(vc, animated: true)
    }
}

private extension LatestCollectionListCell {
    
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
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.48))
        let nestedGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.48), heightDimension: .fractionalHeight(1.0))
        let containerGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.95), heightDimension: .absolute(480))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let nestedGroup = NSCollectionLayoutGroup.vertical(layoutSize: nestedGroupSize, repeatingSubitem: item, count: 2)
        nestedGroup.interItemSpacing = NSCollectionLayoutSpacing.fixed(10)
        
        let containerGroup = NSCollectionLayoutGroup.horizontal(layoutSize: containerGroupSize, repeatingSubitem: nestedGroup, count: 2)
        containerGroup.interItemSpacing = NSCollectionLayoutSpacing.fixed(10)
        
        let section = NSCollectionLayoutSection(group: containerGroup)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0)
        section.orthogonalScrollingBehavior = .continuous
        
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    func cellRegistrationHandler(cell: ArtistChannelListCell, indexPath: IndexPath, item: String) {
        cell.text = item
        cell.musicGroupView.addTarget(self, action: #selector(didTapMusicGroup), for: .touchUpInside)
        cell.playButton.tag = indexPath.item
        cell.playButton.addTarget(self, action: #selector(didTapPlayButton(_:)), for: .touchUpInside)
    }
    
    func configureAccessibilityValue(current index: Int) {
        let label = books[index].title
        let value = "총 \(books.count) 페이지 중 \(index + 1) 페이지"
        let descriptions = [label, value]
        collectionView.accessibilityValue = descriptions.compactMap({ $0 }).joined(separator: ", ")
    }
}
