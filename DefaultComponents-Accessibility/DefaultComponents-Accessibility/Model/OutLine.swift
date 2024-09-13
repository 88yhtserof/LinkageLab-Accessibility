//
//  OutLine.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 9/11/24.
//

import Foundation

struct OutLine: Hashable {
    let title: String
    
    enum OutLineCase: Int {
        case button, text, activityIndicatorWithSwitch, picker
    }
}

extension OutLine {
    static var outlines = [
        OutLine(title: "Button"),
        OutLine(title: "Text"),
        OutLine(title: "ActivityIndicatorWithSwitch"),
        OutLine(title: "Picker")
    ]
}
