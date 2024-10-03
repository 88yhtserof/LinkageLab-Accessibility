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
        let tag: Accessibility
        let title: String
        let description: String
        let view: UIView
    }
    
    enum Accessibility: String {
        // More angle, More Custom
        case standard = "● 기본 컴포넌트"
        case improve = "▲ 개선 컴포넌트"
        case custom = "⭑ 커스텀 컴포넌트"
    }
    
    enum Supplementary: String {
        case title = "title-element-kind"
        
        var name: String {
            self.rawValue
        }
    }
}
