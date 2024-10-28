//
//  RecentSearchWithAccessibilityViewController+Type.swift
//  DefaultComponents-Accessibility
//
//  Created by 임윤휘 on 10/25/24.
//

import Foundation

extension RecentSearchWithAccessibilityViewController {
    enum Section: Int {
        case recent, result
        
        var title: String {
            switch self {
            case .recent:
                return "최근 검색어"
            case .result:
                return "검색 결과"
            }
        }
    }
    
    struct Item: Hashable {
        let recent: UserInfo?
        let result: UserInfo?
        
        init(recent: UserInfo?, result: UserInfo?) {
            self.recent = recent
            self.result = result
        }
        
        init() {
            self.init(recent: nil, result: nil)
        }
        
        init(recent: UserInfo) {
            self.init(recent: recent, result: nil)
        }
        
        init(result: UserInfo) {
            self.init(recent: nil, result: result)
        }
    }
}
