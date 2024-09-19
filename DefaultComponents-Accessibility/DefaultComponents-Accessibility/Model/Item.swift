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
        itemsForDateAndTime,
        itemsForMenu,
        itemsForList,
        itemsForPage,
        itemsForAlert,
        itemsForSheet
    ]
    
    static let itemsForText = [
        Item(title: "UILabel"),
        Item(title: "UITextField"),
        Item(title: "UITextView"),
        Item(title: "UISearchView")
    ]
    
    static let itemsForButton = [
        Item(title: "UIActivityIndicatorView"),
        Item(title: "UIProgressView"),
        Item(title: "UISlider")
    ]
    
    static let itemsForDateAndTime = [
        Item(title: "UIDatePickerView"),
        Item(title: "UICalendarView")
    ]
    
    static let itemsForMenu = [
        Item(title: "UIMenu")
    ]
    
    static let itemsForList = [
        Item(title: "UICollectionView"),
        Item(title: "UITableView")
    ]
    
    static let itemsForPage = [
        Item(title: "UIPageViewController/UIPageControl"),
        Item(title: "UISegmentedController")
    ]
    
    static let itemsForAlert = [
        Item(title: "UIAlertViewController"),
    ]
    
    static let itemsForSheet = [
        Item(title: "PresentationController")
    ]
}
