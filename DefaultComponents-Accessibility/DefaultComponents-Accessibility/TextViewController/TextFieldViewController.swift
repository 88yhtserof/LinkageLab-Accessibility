//
//  TextFieldViewController.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 9/19/24.
//


import UIKit

final class TextFieldController: UIViewController {
    
    var navigationTitle: String? {
        didSet {
            navigationItem.title = navigationTitle
        }
    }
    
    private lazy var defaultBoxView = ComponentBoxView([textFieldForDefault])
    private lazy var pwBoxView = ComponentBoxView([textFieldForPW])
    private lazy var numberBoxView = ComponentBoxView([textFieldForNumber])
    private lazy var emailBoxView = ComponentBoxView([textFieldForEmail])
    
    private lazy var textFieldForDefault = DefaultTextField()
    private lazy var textFieldForPW = DefaultTextField()
    private lazy var textFieldForNumber = DefaultTextField()
    private lazy var textFieldForEmail = DefaultTextField()
    private lazy var stackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSubViews()
        configureView()
        configureConstraints()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.becomeFirstResponder()
    }
}

// MARK: Configuration
private extension TextFieldController {
    func configureSubViews() {
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 20
        
        textFieldForPW.isSecureTextEntry = true
        textFieldForNumber.keyboardType = .numberPad
        textFieldForEmail.keyboardType = .emailAddress
        
        defaultBoxView.title = "기본"
        pwBoxView.title = "비밀번호"
        numberBoxView.title = "숫자"
        emailBoxView.title = "이메일"
    }
    
    func configureView() {
        view.backgroundColor = .systemBackground
        
    }
    
    func configureConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        [ defaultBoxView, pwBoxView, numberBoxView, emailBoxView ]
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
