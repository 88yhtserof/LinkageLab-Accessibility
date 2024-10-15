//
//  ActionableView.swift
//  IssueCard
//
//  Created by 링키지랩 on 10/15/24.
//

import UIKit

class ActionableView: UIView, Actionable {
    var action: ((String, String) -> Void)?
}
