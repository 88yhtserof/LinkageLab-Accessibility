//
//  RecentSearchWithAccessibilityViewController+ListLayout.swift
//  DefaultComponents-Accessibility
//
//  Created by 임윤휘 on 10/25/24.
//

import UIKit

extension RecentSearchWithAccessibilityViewController {
    func layout() -> UICollectionViewLayout {
        let configuration = UICollectionViewCompositionalLayoutConfiguration()
        configuration.interSectionSpacing = 10
        return UICollectionViewCompositionalLayout(sectionProvider: sectionProviderHandler, configuration: configuration)
    }
    
    func sectionProviderHandler(sectionIndex: Int, layourEnviroment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        guard let section = Section(rawValue: sectionIndex) else {
            fatalError("Unknown Section")
        }
        switch section {
        case .recent:
            return sectionForRecent(layoutEnviroment: layourEnviroment)
        case .result:
            return sectionForResult(layoutEnviroment: layourEnviroment)
        }
    }
    
    func sectionForRecent(layoutEnviroment enviroment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        let preferredContentSize = PreferredContentSizeManager.shared.size
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .estimated(10), heightDimension: .fractionalHeight(1.0))
        let groupSize = NSCollectionLayoutSize(widthDimension: .estimated(10), heightDimension: .estimated(CGFloat(preferredContentSize * 10)))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.interGroupSpacing = 10.0
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        section.boundarySupplementaryItems = [titleBoundarySupplementaryItem()]
        return section
        
    }
    
    func sectionForResult(layoutEnviroment enviroment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        let configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
         let section = NSCollectionLayoutSection.list(using: configuration, layoutEnvironment: enviroment)
        section.boundarySupplementaryItems = [titleBoundarySupplementaryItem()]
        return section
    }
    
    func titleBoundarySupplementaryItem() -> NSCollectionLayoutBoundarySupplementaryItem {
        let titleSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .estimated(50))
        return NSCollectionLayoutBoundarySupplementaryItem(layoutSize: titleSize, elementKind: "title-element-kind", alignment: .top)
    }
}
