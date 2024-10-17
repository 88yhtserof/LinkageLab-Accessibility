//
//  MelonChartNavigationViewController+Type.swift
//  DefaultComponents-Accessibility
//
//  Created by 임윤휘 on 10/13/24.
//


import Foundation

//MARK: Types for DataSource
extension MelonChartNavigationViewController {
    enum Section: Int {
        case latest, chart, today
        
        var title: String {
            switch self {
            case .latest:
                return "최신 음악"
            case .chart:
                return "음악 차트"
            case .today:
                return "오늘의 음악"
            }
        }
    }
    
    struct Item: Hashable {
        let latest: String?
        let chart: String?
        let today: String?
        
        init(latest: String?, chart: String?, today: String?) {
            self.latest = latest
            self.chart = chart
            self.today = today
        }
        
        init(latest: String) {
            self.init(latest: latest, chart: nil, today: nil)
        }
        
        init(chart: String) {
            self.init(latest: nil, chart: chart, today: nil)
        }
        
        init(today: String){
            self.init(latest: nil, chart: nil, today: today)
        }
    }
    
    enum Supplementary: String {
        case title = "title-element-kind"
        
        var name: String {
            self.rawValue
        }
    }
}
