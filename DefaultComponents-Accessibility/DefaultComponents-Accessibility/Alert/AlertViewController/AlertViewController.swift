//
//  AlertViewController.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 9/13/24.
//

import UIKit

final class AlertViewController: DefaultCollectionViewController {
    
    lazy var alertForMessageButton = UIButton()
    lazy var alertForSelectButton = UIButton()
    lazy var alertForViewTextField = UIButton()
    lazy var actionSheetForActionButton = UIButton()
    
    init() {
        super.init(isAccessible: true)
        
        configureSubViews()
        let sections = [ "Alert" ]
        
        let items = [
            Item(sectionID: 0, tag: .standard, title: "안내 경고창", description: "안내 메세지를 전달할 수 있는 경고창", view: alertForMessageButton),
            Item(sectionID: 0, tag: .standard, title: "선택 경고창",description: "두개의 선택 사항 중 하나를 선택할 수 있는 경고창", view: alertForSelectButton),
            Item(sectionID: 0, tag: .standard, title: "입력 경고창", description: "입력을 받을 수 있는 경고창", view: alertForViewTextField),
            Item(sectionID: 0, tag: .standard, title: "액션 시트",description: "다양한 동작을 제공할 수 있는 동작 시트", view: actionSheetForActionButton)
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
private extension AlertViewController{
    func configureSubViews() {
        var configuration = UIButton.Configuration.filled()
        configuration.baseBackgroundColor = .blue
        
        let descriptions = [
            "안내",
            "선택",
            "입력",
            "동작"
        ]
        let buttons = [ alertForMessageButton, alertForSelectButton, alertForViewTextField, actionSheetForActionButton ]
        
        zip(buttons, descriptions)
            .forEach{ (button, description) in
                configuration.title = description
                button.configuration = configuration
            }
        
        alertForMessageButton.addTarget(self, action: #selector(didPresentAlertForMessage), for: .touchUpInside)
        alertForSelectButton.addTarget(self, action: #selector(didPresentAlertForSelect), for: .touchUpInside)
        alertForViewTextField.addTarget(self, action: #selector(didPresentAlertForTextField), for: .touchUpInside)
        actionSheetForActionButton.addTarget(self, action: #selector(didPresentActionSheetForAction), for: .touchUpInside)
    }
}
