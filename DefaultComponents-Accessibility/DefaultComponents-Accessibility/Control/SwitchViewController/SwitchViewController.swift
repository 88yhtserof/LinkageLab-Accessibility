//
//  SwitchViewController.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 9/20/24.
//

import UIKit

final class SwitchViewController: DefaultViewController {
    
    var dataSource: DataSource!
    var snapshot: Snapshot!
    var wifies = WiFi.wifies
    var isEnabled: Bool = true
    let toggle = UISwitch()
    
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSubViews()
        configureConstraints()
    }
}

// MARK: Configuration
private extension SwitchViewController {
    func configureSubViews() {
        toggle.isOn = true
        toggle.isAccessibilityElement = false
        toggle.addTarget(self, action: #selector(didToggleSwitch), for: .valueChanged)
        
        let controlCellRegistration = UICollectionView.CellRegistration(handler: controlCellRegistrationHandler)
        let listCellRegistraion = UICollectionView.CellRegistration(handler: listCellRegistrationHandler)
        
        dataSource = DataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier -> UICollectionViewCell in
            let section = Section(rawValue: indexPath.section) ?? .control
            switch section {
            case .control:
                return collectionView.dequeueConfiguredReusableCell(using: controlCellRegistration, for: indexPath, item: itemIdentifier)
            case .list:
                return collectionView.dequeueConfiguredReusableCell(using: listCellRegistraion, for: indexPath, item: itemIdentifier)
            }
        })
        
        updateSnapshot()
        collectionView.dataSource = dataSource
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
private extension SwitchViewController {
    func layout() -> UICollectionViewLayout {
        let configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        return UICollectionViewCompositionalLayout.list(using: configuration)
    }
}
