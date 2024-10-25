//
//  Detail.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 9/19/24.
//

import Foundation

struct Detail: Hashable {
    let title: String
    
    enum SectionCase: Int {
        case text, control, state, dateAndTime, list, page, alert, sheet
    }
    
    enum Accessibility: String {
        // More angle, More Custom
        case standard = "● 기본 컴포넌트"
        case improve = "▲ 개선 컴포넌트"
        case custom = "⭑ 커스텀 컴포넌트"
        
        var title: String {
            self.rawValue
        }
        
        var accessibilityLabel: String {
            return String(title.suffix(title.count - 2))
        }
    }
    
    var accessibilityLabel: String {
        title
            .split(whereSeparator: { ["|", "●", "▲", "⭑"].contains($0) })
            .joined(separator: ",")
    }
}

extension Detail {
    
    static let items = [
        itemsForText,
        itemsForControl,
        itemsForState,
        itemsForDateAndTime,
        itemsForList,
        itemsForPage,
        itemsForAlert,
        itemsForSheet
    ]
    
    private static let itemsForText = [
        Detail(title: "Label | TextField | TextView"),
        Detail(title: "SearchView ● 기본 컴포넌트"),
        Detail(title: "SearchView ▲ 개선 컴포넌트"),
        Detail(title: "최근 검색어 ● 기본 컴포넌트"),
        Detail(title: "최근 검색어 ▲ 개선 컴포넌트")
    ]
    
    private static let itemsForControl = [
        Detail(title: "Button | Slider"),
        Detail(title: "Switch")
    ]
    
    private static let itemsForState = [
        Detail(title: "ActivityIndicatorView | ProgressView")
    ]
    
    private static let itemsForDateAndTime = [
        Detail(title: "DatePickerView | CalendarView")
    ]
    
    private static let itemsForList = [
        Detail(title: "CollectionView ● 기본 컴포넌트"),
        Detail(title: "CollectionView ▲ 개선 컴포넌트"),
        Detail(title: "TableView ● 기본 컴포넌트"),
        Detail(title: "TableView ▲ 개선 컴포넌트"),
        Detail(title: "뉴스 더보기 ● 기본 컴포넌트"),
        Detail(title: "뉴스 더보기 ▲ 개선 컴포넌트"),
        Detail(title: "멜론 차트 탐색 ● 기본 컴포넌트"),
        Detail(title: "멜론 차트 탐색 ▲ 개선 컴포넌트")
    ]
    
    private static let itemsForPage = [
        Detail(title: "PageViewController ● 기본 컴포넌트"),
        Detail(title: "PageViewController ▲ 개선 컴포넌트")
    ]
    
    private static let itemsForAlert = [
        Detail(title: "AlertViewController"),
    ]
    
    private static let itemsForSheet = [
        Detail(title: "PresentationController | Menu")
    ]
}
