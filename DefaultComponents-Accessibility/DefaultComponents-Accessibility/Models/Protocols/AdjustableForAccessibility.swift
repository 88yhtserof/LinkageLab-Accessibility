//
//  AdjustableForAccessibility.swift
//  DefaultComponents-Accessibility
//
//  Created by 임윤휘 on 10/14/24.
//

import UIKit

protocol AdjustableForAccessibility: AnyObject {
    func adjustableIncrement(_ view: AnyObject)
    func adjustableDecrement(_ view: AnyObject)
}
