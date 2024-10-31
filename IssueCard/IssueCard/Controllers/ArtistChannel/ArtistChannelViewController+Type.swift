//
//  ArtistChannelViewController+Type.swift
//  IssueCard
//
//  Created by 링키지랩 on 10/30/24.
//

import Foundation

//MARK: Types for DataSource
extension ArtistChannelViewController {
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
    
    enum Item: Int {
        case latest, chart, today
    }
    
    enum Supplementary: String {
        case title = "title-element-kind"
        
        var name: String {
            self.rawValue
        }
    }
}
