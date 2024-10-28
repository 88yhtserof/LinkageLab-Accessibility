//
//  PageViewControllerWithAccessibility.swift
//  DefaultComponents-Accessibility
//
//  Created by 임윤휘 on 10/6/24.
//

import UIKit

final class PageViewControllerWithAccessibility: DefaultViewController {
    
    var pages: [UIViewController] = []
    
    lazy var pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
    lazy var pageView = UIView()
    lazy var vc1 = PageDetailViewController(backgroundColor: .systemYellow, text: "첫 번째 페이지")
    lazy var vc2 = PageDetailViewController(backgroundColor: .systemBlue, text: "두 번째 페이지")
    lazy var vc3 = PageDetailViewController(backgroundColor: .systemMint, text: "세 번째 페이지")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureConstraints()
        pageView.isAccessibilityElement = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        pageView.isAccessibilityElement = false
    }
}

extension PageViewControllerWithAccessibility {
    func configureView() {
        pages = [ vc1, vc2, vc3 ]
        pageViewController.view.backgroundColor = .black
        pageViewController.setViewControllers([pages[0]], direction: .forward, animated: true)
        pageViewController.dataSource = self
    }
    
    func configureConstraints() {
        view.addSubviews([pageView])
        pageView.addPinnedSubview(pageViewController.view, height: nil)
        
        NSLayoutConstraint.activate([
            pageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            pageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            pageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            pageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
