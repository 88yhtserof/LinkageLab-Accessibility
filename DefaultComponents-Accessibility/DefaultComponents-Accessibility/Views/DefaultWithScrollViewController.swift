//
//  DefaultWithScrollViewController.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 9/24/24.
//

import UIKit

class DefaultWithScrollViewController: DefaultViewController {
    
    lazy var contentView = UIView()
    private lazy var scrollView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addPinnedSubview(scrollView, height: nil)
        scrollView.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            
            contentView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor)
        ])
    }
}
