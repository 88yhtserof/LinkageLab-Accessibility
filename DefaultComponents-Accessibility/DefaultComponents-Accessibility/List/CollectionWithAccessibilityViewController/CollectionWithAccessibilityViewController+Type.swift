//
//  CollectionWithAccessibilityViewController+Type.swift
//  DefaultComponents-Accessibility
//
//  Created by 임윤휘 on 10/20/24.
//

import Foundation

//MARK: Types for DataSource
extension CollectionWithAccessibilityViewController {
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
