//
//  PresentationAndMenuViewController.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 9/23/24.
//

import UIKit

final class PresentationAndMenuViewController: DefaultViewController {
    
    var isAccessible: Bool!
    
    lazy var presentBoxView = ComponentBoxView([presentButton])
    lazy var presentButton = UIButton()
    lazy var presentBoxViewWithAccessibility = ComponentBoxView([presentButtonWithAccessibility])
    lazy var presentButtonWithAccessibility = UIButton()
    private lazy var menuBoxView = ComponentBoxView([menuButton])
    private lazy var menuButton = UIButton()
    lazy var menuBoxViewWithAccessibility = ComponentBoxView([menuButtonWithAccessibility])
    lazy var menuButtonWithAccessibility = UIButton()
    private lazy var stackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSubviews()
        configureConstraints()
    }
}

// MARK: Configuration
extension PresentationAndMenuViewController {
    func configureSubviews() {
        var configForPresent = UIButton.Configuration.filled()
        configForPresent.title = "책 목록 확인"
        configForPresent.subtitle = "PresentationController 시연"
        configForPresent.titleAlignment = .center
        presentButton.configuration = configForPresent
        presentButton.addTarget(self, action: #selector(didTapPresentButton), for: .touchUpInside)
        
        configForPresent.title = "책 목록 확인 with Accessibility"
        presentButtonWithAccessibility.configuration = configForPresent
        presentButtonWithAccessibility.addTarget(self, action: #selector(didTapPresentButton), for: .touchUpInside)
        
        let items = [ changeBackgroundAction(menuButton), moreMenu(menuButton) ]
        let menu = UIMenu(title: "UIMenu", children: items)
        var configForeMenu = UIButton.Configuration.filled()
        configForeMenu.title = "더보기"
        configForeMenu.subtitle = "UIMenu 시연"
        configForeMenu.titleAlignment = .center
        menuButton.menu = menu
        menuButton.configuration = configForeMenu
        
        let itemsWithAccessibility = [ changeBackgroundAction(menuButtonWithAccessibility), moreMenu(menuButtonWithAccessibility) ]
        let menuWithAccessibility = UIMenu(title: "UIMenu", children: itemsWithAccessibility)
        configForeMenu.title = "더보기 with Accessibility"
        menuButtonWithAccessibility.menu = menuWithAccessibility
        menuButtonWithAccessibility.configuration = configForeMenu
        menuButtonWithAccessibility.accessibilityHint = "동작을 활성화하려면 이중탭하고 누른 채로 있으십시오"
        
        stackView.axis = .vertical
        stackView.spacing = 10
    }
    
    func configureConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        [ presentBoxView, presentBoxViewWithAccessibility, menuBoxView, menuButtonWithAccessibility ]
            .forEach{ stackView.addArrangedSubview($0) }
        
        let horizontalInset: CGFloat = 40
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: horizontalInset),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -horizontalInset)
        ])
    }
}
