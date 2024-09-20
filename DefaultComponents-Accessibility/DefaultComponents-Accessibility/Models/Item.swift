//
//  Item.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 9/19/24.
//

import Foundation

struct Item: Hashable {
    let title: String
}

extension Item {
    
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
        Item(title: "UILabel"),
        Item(title: "UITextField / UITextView"),
        Item(title: "UISearchView")
    ]
    
    private static let itemsForButton = [
        Item(title: "UIButton"),
        Item(title: "UISwitch / UISlider")
    ]
    
    private static let itemsForState = [
        Item(title: "UIActivityIndicatorView"),
        Item(title: "UIProgressView")
    ]
    
    private static let itemsForDateAndTime = [
        Item(title: "UIDatePickerView"),
        Item(title: "UICalendarView")
    ]
    
    private static let itemsForMenu = [
        Item(title: "UIMenu")
    ]
    
    private static let itemsForList = [
        Item(title: "UICollectionView"),
        Item(title: "UITableView")
    ]
    
    private static let itemsForPage = [
        Item(title: "UIPageViewController/UIPageControl"),
        Item(title: "UISegmentedController")
    ]
    
    private static let itemsForAlert = [
        Item(title: "UIAlertViewController"),
    ]
    
    private static let itemsForSheet = [
        Item(title: "PresentationController")
    ]
}
