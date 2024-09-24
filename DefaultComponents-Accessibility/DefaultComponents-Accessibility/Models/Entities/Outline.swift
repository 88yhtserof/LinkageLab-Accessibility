//
//  Outline.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 9/11/24.
//

import Foundation

struct Outline: Hashable {
    let title: String
    
    enum OutLineCase: Int {
        case text, control, activityIndicatorWithSwitch, picker
    }
}

extension Outline {
    static var sections = [
        Outline(title: "Text"),
        Outline(title: "Control"),
        Outline(title: "State"),
        Outline(title: "DateAndTime"),
        Outline(title: "List"),
        Outline(title: "Page"),
        Outline(title: "Alert"),
        Outline(title: "Sheet")
    ]
}
