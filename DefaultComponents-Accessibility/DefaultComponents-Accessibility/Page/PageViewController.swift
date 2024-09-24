//
//  PageViewController.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 9/23/24.
//

import UIKit

final class PageViewController: UIPageViewController, Titleable {
    
    var navigationTitle: String? {
        didSet {
            navigationItem.title = navigationTitle
        }
    }
    
    var pages: [UIViewController] = []
    
    lazy var pageControl = UIPageControl()
    lazy var vc1 = LabelViewController()
    lazy var vc2 = ButtonAndSliderViewController()
    lazy var vc3 = DateAndTimeViewController()
    
    init() {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
}

extension PageViewController {
    func configureView() {
        pages = [ vc1, vc2, vc3 ]
        setViewControllers([pages[0]], direction: .forward, animated: true)
        dataSource = self
    }
    
    func configureConstraints() {
        view.addSubview(pageControl)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            pageControl.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            pageControl.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            pageControl.widthAnchor.constraint(equalToConstant: 40)
        ])
    }
}
