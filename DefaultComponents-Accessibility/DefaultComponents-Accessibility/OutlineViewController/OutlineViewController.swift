//
//  OutlineViewController.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 9/11/24.
//

import UIKit

final class OutlineViewController: UIViewController {
    
    var dataSource: DataSource!
    var snapshot: Snapshot!
    var outlines = Outline.outlines
    
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSubViews()
        configureView()
        configureConstraints()
    }
}

// MARK: Configuration
private extension OutlineViewController {
    func configureSubViews() {
        collectionView.delegate = self
        
        let cellRegistraion = UICollectionView.CellRegistration(handler: cellRegistrationHandler)
        
        dataSource = DataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier -> UICollectionViewCell in
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistraion, for: indexPath, item: itemIdentifier)
        })
        
        updateSnapshot()
        collectionView.dataSource = dataSource
    }
    
    func configureView() {
        view.backgroundColor = .systemBackground
    }
    
    func configureConstraints() {
        [ collectionView ]
            .forEach{
                $0.translatesAutoresizingMaskIntoConstraints = false
                view.addSubview($0)
            }
        
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor)
        ])
    }
}

// MARK: CollectionView Layout
private extension OutlineViewController {
    func layout() -> UICollectionViewLayout {
        let configuration = UICollectionLayoutListConfiguration(appearance: .grouped)
        return UICollectionViewCompositionalLayout.list(using: configuration)
    }
}
