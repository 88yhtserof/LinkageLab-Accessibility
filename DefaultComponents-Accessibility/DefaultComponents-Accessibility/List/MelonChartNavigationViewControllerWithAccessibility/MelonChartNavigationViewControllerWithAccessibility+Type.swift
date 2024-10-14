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
    
    struct Item: Hashable {
        let latest: String?
        let chart: String?
        let custom: Bool?
        
        init(latest: String?, chart: String?, custom: Bool?) {
            self.latest = latest
            self.chart = chart
            self.custom = custom
        }
        
        init(latest: String) {
            self.init(latest: latest, chart: nil, custom: nil)
        }
        
        init(chart: String) {
            self.init(latest: nil, chart: chart, custom: nil)
        }
        
        init(custom: Bool) {
            self.init(latest: nil, chart: nil, custom: custom)
        }
        
    }
    
    enum Supplementary: String {
        case title = "title-element-kind"
        
        var name: String {
            self.rawValue
        }
    }
    
    enum AccessibilityFrameState {
        case initial, scroll
    }
}
