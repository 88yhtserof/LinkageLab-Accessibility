//
//  Detail.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 9/19/24.
//

import Foundation

struct Detail: Hashable {
    let title: String
}

extension Detail {
    
    static let items = [
        itemsForText,
        itemsForButton,
        itemsForState,
        itemsForDateAndTime,
        itemsForMenu,
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
        Detail(title: "UILabel"),
        Detail(title: "UITextField / UITextView"),
        Detail(title: "UISearchView")
    ]
    
    private static let itemsForButton = [
        Detail(title: "UIButton / UISlider"),
        Detail(title: "UISwitch")
    ]
    
    private static let itemsForState = [
        Detail(title: "UIActivityIndicatorView"),
        Detail(title: "UIProgressView")
    ]
    
    private static let itemsForDateAndTime = [
        Detail(title: "UIDatePickerView"),
        Detail(title: "UICalendarView")
    ]
    
    private static let itemsForMenu = [
        Detail(title: "UIMenu")
    ]
    
    private static let itemsForList = [
        Detail(title: "UICollectionView"),
        Detail(title: "UITableView")
    ]
    
    private static let itemsForPage = [
        Detail(title: "UIPageViewController/UIPageControl"),
        Detail(title: "UISegmentedController")
    ]
    
    private static let itemsForAlert = [
        Detail(title: "UIAlertViewController"),
    ]
    
    private static let itemsForSheet = [
        Detail(title: "PresentationController")
    ]
}
