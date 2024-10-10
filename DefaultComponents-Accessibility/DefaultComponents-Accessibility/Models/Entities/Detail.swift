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
    
    static let test = [
        "UILabel",
        "UIText"
    ]
    
    private static let itemsForText = [
        Detail(title: "UILabel / UITextField / UITextView"),
        Detail(title: "UISearchView ● 기본 컴포넌트"),
        Detail(title: "UISearchView ▲ 개선 컴포넌트")
    ]
    
    private static let itemsForControl = [
        Detail(title: "UIButton / UISlider"),
        Detail(title: "UISwitch")
    ]
    
    private static let itemsForState = [
        Detail(title: "UIActivityIndicatorView / UIProgressView")
    ]
    
    private static let itemsForDateAndTime = [
        Detail(title: "UIDatePickerView / UICalendarView")
    ]
    
    private static let itemsForList = [
        Detail(title: "UICollectionView ● 기본 컴포넌트"),
        Detail(title: "UICollectionView ▲ 개선 컴포넌트"),
        Detail(title: "UITableView ● 기본 컴포넌트"),
        Detail(title: "UITableView ▲ 개선 컴포넌트"),
        Detail(title: "뉴스 더보기 ● 기본 컴포넌트"),
        Detail(title: "뉴스 더보기 ▲ 개선 컴포넌트")
    ]
    
    private static let itemsForPage = [
        Detail(title: "UIPageViewController ● 기본 컴포넌트"),
        Detail(title: "UIPageViewController ▲ 개선 컴포넌트")
    ]
    
    private static let itemsForAlert = [
        Detail(title: "UIAlertViewController"),
    ]
    
    private static let itemsForSheet = [
        Detail(title: "PresentationController / UIMenu")
    ]
}
