//
//  CollectionViewController+Type.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 9/23/24.
//

import Foundation

//MARK: Types for DataSource
extension CollectionViewController {
    enum Section: Int {
        case pagable
        case list
        
        var title: String {
            switch self {
            case .pagable:
                return "Pagable"
            case .list:
                return "List"
            }
        }
    }
    
    struct Item: Hashable {
        let pagable: String?
        let list: String?
        
        init(pagable: String? = nil, list: String? = nil) {
            self.pagable = pagable
            self.list = list
        }
    }
    
    enum Supplementary: String {
        case title = "title-element-kind"
        
        var name: String {
            self.rawValue
        }
    }
}
