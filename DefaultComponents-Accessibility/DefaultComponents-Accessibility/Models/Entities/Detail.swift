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
        Detail(title: "UILabel"),
        Detail(title: "UITextField / UITextView"),
        Detail(title: "UISearchView")
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
        Detail(title: "UICollectionView"),
        Detail(title: "UITableView")
    ]
    
    private static let itemsForPage = [
        Detail(title: "UIPageViewController / UIPageControl")
    ]
    
    private static let itemsForAlert = [
        Detail(title: "UIAlertViewController"),
    ]
    
    private static let itemsForSheet = [
        Detail(title: "PresentationController / UIMenu")
    ]
}
