//
//  DefaultAccessibilityViewController.swift
//  IssueCard
//
//  Created by 링키지랩 on 10/30/24.
//

import UIKit

class DefaultAccessibilityViewController: UIViewController {
    var navigationTitle: String? {
        didSet {
            navigationItem.title = navigationTitle
        }
    }
    
    var contentDescription: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        if let rootVC = navigationController?.viewControllers.first, rootVC != self {
            navigationItem.hidesBackButton = true
            navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: self, action: #selector(didTapBackButton))
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if UIAccessibility.isVoiceOverRunning,
           let leftBarButtonItem = navigationItem.leftBarButtonItem {
            navigationItem.leftBarButtonItem?.accessibilityLabel = "뒤로 가기"
            Task {
                try? await UIAccessibility.setFocus(to: leftBarButtonItem)
            }
        }
    }
    
    @objc func didTapBackButton() {
        navigationController?.popViewController(animated: true)
    }
}
