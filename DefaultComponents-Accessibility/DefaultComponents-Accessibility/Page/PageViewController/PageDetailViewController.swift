//
//  PageDetailViewController.swift
//  DefaultComponents-Accessibility
//
//  Created by 임윤휘 on 10/6/24.
//

import UIKit

final class PageDetailViewController: UIViewController {
    
    private let text: String
    
    init(backgroundColor: UIColor, text: String) {
        self.text = text
        super.init(nibName: .none, bundle: .none)
        view.backgroundColor = backgroundColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let textView = UILabel()
        textView.text = self.text
        textView.font = .systemFont(ofSize: 30, weight: .bold)
        
        view.addSubviews([textView])
        NSLayoutConstraint.activate([
            textView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            textView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)
        ])
    }
}
