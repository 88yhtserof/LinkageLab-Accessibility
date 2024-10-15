//
//  MapInfo.swift
//  IssueCard
//
//  Created by 링키지랩 on 10/15/24.
//

import UIKit

struct MapInfo: Hashable {
    let image: String
    let innerView: UIView
    let rightView: UIView?
    
    init(image: String, innerView: UIView, rightView: UIView?) {
        self.image = image
        self.innerView = innerView
        self.rightView = rightView
    }
}

extension MapInfo {
    static let samples = [
        MapInfo(image: "phone.fill", innerView: PhoneNumberView(phoneNumber: "02-6250-0699"), rightView: nil)
    ]
}
