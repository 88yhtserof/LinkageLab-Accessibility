//
//  PresentationAndMenuViewController.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 9/23/24.
//

import UIKit

final class PresentationAndMenuViewController: DefaultCollectionViewController {
    
    var isPresentAccessible: Bool!
    
    lazy var presentButton = UIButton()
    lazy var presentButtonWithAccessibility = UIButton()
    private lazy var menuButton = UIButton()
    lazy var menuButtonWithAccessibility = UIButton()
    
    init() {
        super.init(isAccessible: true)
        
        configureSubviews()
        let sections = [
            "PresentationContoller",
            "Menu"
        ]
        
        let items = [
            Item(sectionID: 0, tag: .standard, title: "확장 규모 조정 가능 화면", description: "화면의 높이를 조정할 수 있습니다.", view: presentButton),
            Item(sectionID: 0, tag: .custom, title: "확장 규모 조정 가능 화면", description: "화며의 높이를 조정할 수 있으며 \n내용 및 확장 정도를 음성 안내합니다.", view: presentButtonWithAccessibility),
            Item(sectionID: 1, tag: .standard, title: "메뉴", description: "여러 동작을 담을 수 있습니다.", view: menuButton),
            Item(sectionID: 1, tag: .improve, title: "메뉴", description: "여러 동작을 담을 수 있을 수 있으며 동작 힌트를 제공합니다. ", view: menuButtonWithAccessibility)
        ]
        super.sections = sections
        super.items = items
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: Configuration
extension PresentationAndMenuViewController {
    func configureSubviews() {
        var configForPresent = UIButton.Configuration.filled()
        configForPresent.title = "책 목록 확인"
        configForPresent.titleAlignment = .center
        presentButton.configuration = configForPresent
        presentButton.addTarget(self, action: #selector(didTapPresentButton), for: .touchUpInside)
        
        configForPresent.title = "책 목록 확인"
        presentButtonWithAccessibility.configuration = configForPresent
        presentButtonWithAccessibility.addTarget(self, action: #selector(didTapPresentButton), for: .touchUpInside)
        
        let items = [ changeBackgroundAction(menuButton), moreMenu(menuButton) ]
        let menu = UIMenu(title: "UIMenu", children: items)
        var configForeMenu = UIButton.Configuration.filled()
        configForeMenu.title = "더보기"
        configForeMenu.titleAlignment = .center
        menuButton.menu = menu
        menuButton.configuration = configForeMenu
        
        let itemsWithAccessibility = [ changeBackgroundAction(menuButtonWithAccessibility), moreMenu(menuButtonWithAccessibility) ]
        let menuWithAccessibility = UIMenu(title: "UIMenu", children: itemsWithAccessibility)
        menuButtonWithAccessibility.menu = menuWithAccessibility
        menuButtonWithAccessibility.configuration = configForeMenu
        menuButtonWithAccessibility.accessibilityHint = "동작을 활성화하려면 이중탭하고 누른 채로 있으십시오"
    }
}
