//
//  AlertViewController.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 9/13/24.
//

import UIKit

final class AlertViewController: UIViewController {
    
    lazy var stackView = UIStackView()
    lazy var alertForMessageButton = UIButton()
    lazy var alertForSelectButton = UIButton()
    lazy var alertForViewTextField = UIButton()
    lazy var actionSheetForActionButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSubViews()
        configureView()
        configureConstraints()
    }
}

// MARK: Configuration
private extension AlertViewController{
    func configureSubViews() {
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        
        var configuration = UIButton.Configuration.filled()
        configuration.baseBackgroundColor = .blue
        
        let descriptions = [
            "Alert: 안내",
            "Alert: 선택",
            "Alert: 입력",
            "ActionSheet: 동작"
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
    
    func configureView() {
        view.backgroundColor = .systemBackground
    }
    
    func configureConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        [ alertForMessageButton, alertForSelectButton, alertForViewTextField, actionSheetForActionButton ]
            .forEach{
                $0.translatesAutoresizingMaskIntoConstraints = false
                stackView.addArrangedSubview($0)
            }
        
        let horizontalInset: CGFloat = 50
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: horizontalInset),
            stackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -horizontalInset)
        ])
    }
}
