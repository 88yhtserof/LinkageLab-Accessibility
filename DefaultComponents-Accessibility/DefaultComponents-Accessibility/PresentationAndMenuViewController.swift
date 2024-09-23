//
//  PresentationAndMenuViewController.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 9/23/24.
//

import UIKit

final class PresentationAndMenuViewController: UIViewController {
    
    var navigationTitle: String? {
        didSet {
            navigationItem.title = navigationTitle
        }
    }
    private lazy var presentBoxView = ComponentBoxView([presentButton])
    private lazy var presentButton = UIButton()
    private lazy var menuBoxView = ComponentBoxView([menuButton])
    private lazy var menuButton = UIButton()
    private lazy var stackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSubviews()
        configureView()
        configureConstraints()
    }
}

// MARK: Configuration
extension PresentationAndMenuViewController {
    func configureSubviews() {
        var configForPresent = UIButton.Configuration.filled()
        configForPresent.title = "화면 Present"
        presentButton.configuration = configForPresent
        presentButton.addTarget(self, action: #selector(didTapPresentButton), for: .touchUpInside)
        
        let items = [ changeBackgroundAction(), moreMenu() ]
        let menu = UIMenu(title: "UIMenu", children: items)
        var configForeMenu = UIButton.Configuration.filled()
        configForeMenu.title = "Menu 보기"
        configForeMenu.subtitle = "버튼을 길게 눌러주세요"
        configForeMenu.titleAlignment = .center
        menuButton.menu = menu
        menuButton.configuration = configForeMenu
        
        stackView.axis = .vertical
        stackView.spacing = 10
    }
    
    func configureView() {
        view.backgroundColor = .white
    }
    
    func configureConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        [ presentBoxView, menuBoxView ]
            .forEach{ stackView.addArrangedSubview($0) }
        
        let horizontalInset: CGFloat = 40
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: horizontalInset),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -horizontalInset)
        ])
    }
}
