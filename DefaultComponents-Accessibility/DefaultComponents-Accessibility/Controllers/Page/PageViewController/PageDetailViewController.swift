//
//  PageDetailViewController.swift
//  DefaultComponents-Accessibility
//
//  Created by 임윤휘 on 10/6/24.
//

import UIKit

final class PageDetailViewController: UIViewController {
    
    private let text: String
    
    private lazy var textLabel = UILabel()
    
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
        
        textLabel.text = self.text
        
        view.addSubviews([textLabel])
        NSLayoutConstraint.activate([
            textLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            textLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)
        ])
        
        setPreferredFontyStyle()
    }
}

extension PageDetailViewController: DynamicTypeable {
    func setPreferredFontyStyle() {
        textLabel.font = UIFont.preferredFont(forTextStyle: .headline)
    }
}
