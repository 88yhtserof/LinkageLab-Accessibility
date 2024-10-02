//
//  DefaultCollectionViewController+ListLayout.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 10/2/24.
//

import UIKit

// MARK: CollectionView Layout
extension DefaultCollectionViewController {
    
    func layout() -> UICollectionViewLayout {
        let configuration = UICollectionViewCompositionalLayoutConfiguration()
        configuration.interSectionSpacing = 50
        return UICollectionViewCompositionalLayout(sectionProvider: sectionProviderHandler, configuration: configuration)
    }
    
    func sectionProviderHandler( sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        sectionForList(layoutEnvironment)
    }
    
    func sectionForList(_ layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        let size = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(1.0))
        
        let item = NSCollectionLayoutItem(layoutSize: size)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: size, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 30
        section.boundarySupplementaryItems = [titleBoundarySupplementaryItem()]
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 10)
        
        return section
    }
    
    func titleBoundarySupplementaryItem() -> NSCollectionLayoutBoundarySupplementaryItem {
        let titleSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .estimated(50))
        return NSCollectionLayoutBoundarySupplementaryItem(layoutSize: titleSize, elementKind: Supplementary.title
            .name, alignment: .top)
    }
}
