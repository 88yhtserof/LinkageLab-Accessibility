//
//  AdjustableForAccessibility.swift
//  IssueCard
//
//  Created by 링키지랩 on 10/30/24.
//

import UIKit

protocol AdjustableForAccessibility: AnyObject {
    func adjustableIncrement(_ view: AnyObject)
    func adjustableDecrement(_ view: AnyObject)
}
