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
        case latest, chart
        
        var title: String {
            switch self {
            case .latest:
                return "Latest"
            case .chart:
                return "Chart"
            }
        }
    }
    
    struct Item: Hashable {
        let latest: String?
        let chart: String?
        
        init(latest: String?) {
            self.latest = latest
            self.chart = nil
        }
        
        init(chart: String?) {
            self.chart = chart
            self.latest = nil
        }
    }
    
    enum Supplementary: String {
        case title = "title-element-kind"
        
        var name: String {
            self.rawValue
        }
    }
}
