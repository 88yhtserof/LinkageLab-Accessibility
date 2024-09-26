//
//  WiFi.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 9/26/24.
//

import Foundation

struct WiFi: Hashable {
    let title: String
}

extension WiFi {
    static var wifies = [
        WiFi(title: "LinkageLab_Guest"),
        WiFi(title: "LinkageLab_WiFi"),
        WiFi(title: "WONDERPLACE_Guest"),
        WiFi(title: "WONDERPLACE_Wifi"),
        WiFi(title: "Second Floor"),
        WiFi(title: "AirSpace1")
    ]
}
