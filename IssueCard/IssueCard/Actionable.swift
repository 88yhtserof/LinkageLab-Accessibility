//
//  Actionable.swift
//  IssueCard
//
//  Created by 링키지랩 on 10/15/24.
//

import UIKit

protocol Actionable: AnyObject, Hashable {
    var action: ((String, String) ->  Void)? { get set }
}
