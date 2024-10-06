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
        
        if let rootVC = navigationController?.viewControllers.first, rootVC != self {
            navigationItem.hidesBackButton = true
            navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: self, action: #selector(didTapBackButton))
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if UIAccessibility.isVoiceOverRunning {
            navigationItem.leftBarButtonItem?.accessibilityLabel = "뒤로 가기"
            Task {
                try? await UIAccessibility.setFocus(to: navigationItem.leftBarButtonItem)
            }
        }
    }
    
    @objc func didTapBackButton() {
        navigationController?.popViewController(animated: true)
    }
}
