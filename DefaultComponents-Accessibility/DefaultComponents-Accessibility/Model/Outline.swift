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
        case button, text, activityIndicatorWithSwitch, picker
    }
}

extension Outline {
    static var outlines = [
        Outline(title: "Button"),
        Outline(title: "Text"),
        Outline(title: "State"),
        Outline(title: "Picker")
    ]
}
