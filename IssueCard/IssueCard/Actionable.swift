//
//  Actionable.swift
//  IssueCard
//
//  Created by 링키지랩 on 10/15/24.
//

import Foundation

protocol Actionable: AnyObject {
    var action: ((String, String) ->  Void)? { get set }
}
