//
//  MelonChartNavigationViewControllerWithAccessibility+Type.swift
//  DefaultComponents-Accessibility
//
//  Created by 임윤휘 on 10/13/24.
//

import Foundation

//MARK: Types for DataSource
extension MelonChartNavigationViewControllerWithAccessibility {
    enum Section: Int {
        case latest, chart, custom
        
        var title: String {
            switch self {
            case .latest:
                return "Latest"
            case .chart:
                return "Chart"
            case .custom:
                return "Custom"
            }
        }
    }
    
    enum Item: Int {
        case latest, chart, custom
    }
    
    enum Supplementary: String {
        case title = "title-element-kind"
        
        var name: String {
            self.rawValue
        }
    }
}
