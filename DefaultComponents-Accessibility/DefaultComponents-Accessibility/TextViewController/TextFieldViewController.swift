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
        
        textFieldForDefault.placeholderText = "원하는 데이터를 입력하세요"
        textFieldForPW.isSecureTextEntry = true
        textFieldForPW.placeholderText = "비밀번호를 입력하세요"
        textFieldForNumber.keyboardType = .numberPad
        textFieldForNumber.placeholderText = "해당하는 숫자를 입력하세요"
        textFieldForEmail.keyboardType = .emailAddress
        textFieldForEmail.placeholderText = "예: default@email.com"
        
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
