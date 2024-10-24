//
//  RecentSearchViewController+Type.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 10/24/24.
//

import Foundation

extension RecentSearchViewController {
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
        let recent: String?
        let result: String?
        
        init(recent: String?, result: String?) {
            self.recent = recent
            self.result = result
        }
        
        init(recent: String) {
            self.init(recent: recent, result: nil)
        }
        
        init(result: String) {
            self.init(recent: nil, result: result)
        }
    }
}
