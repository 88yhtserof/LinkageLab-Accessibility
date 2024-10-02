//
//  DefaultViewController.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 9/24/24.
//

import UIKit

class DefaultViewController: UIViewController, Titleable {
    
    var navigationTitle: String? {
        didSet {
            navigationItem.title = navigationTitle
        }
    }
    
    var contentDescription: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
}
