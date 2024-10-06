//
//  DefaultCollectionViewController+Type.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 10/2/24.
//

import UIKit

//MARK: Types for DataSource
extension DefaultCollectionViewController {
    struct Item: Hashable {
        var id = UUID()
        let sectionID: Int
        let tag: Detail.Accessibility
        let title: String
        let description: String
        let view: UIView
    }
    
    enum Supplementary: String {
        case title = "title-element-kind"
        
        var name: String {
            self.rawValue
        }
    }
}
