//
//  TextViewController.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 9/19/24.
//


import UIKit

final class TextViewController: DefaultWithScrollViewController {
    
    private lazy var maximumLinesBoxView = ComponentBoxView([labelForMiximumLines])
    private lazy var defaultBoxView = ComponentBoxView([textFieldForDefault])
    private lazy var pwBoxView = ComponentBoxView([textFieldForPW])
    private lazy var numberBoxView = ComponentBoxView([textFieldForNumber])
    private lazy var emailBoxView = ComponentBoxView([textFieldForEmail])
    private lazy var textViewBoxView = ComponentBoxView([textView])
    
    private lazy var labelForMiximumLines = UILabel()
    private lazy var textFieldForDefault = DefaultTextField()
    private lazy var textFieldForPW = DefaultTextField()
    private lazy var textFieldForNumber = DefaultTextField()
    private lazy var textFieldForEmail = DefaultTextField()
    private lazy var textView = UITextView()
    private lazy var stackView = UIStackView()
    
    private lazy var textInputViews = [ textFieldForDefault, textFieldForPW, textFieldForNumber, textFieldForEmail, textView ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSubViews()
        configureConstraints()
        registerKeyboardNotifications()
    }
    
    deinit {
        removeKeyboardNotification()
    }
}

// MARK: Configuration
private extension TextViewController {
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
        textView.font = .systemFont(ofSize: 20)
        textView.backgroundColor = .systemGray6
        
        defaultBoxView.title = "기본"
        pwBoxView.title = "비밀번호"
        numberBoxView.title = "숫자"
        emailBoxView.title = "이메일"
        textViewBoxView.title = "TextView 여러 줄 입력 상자"
        
        maximumLinesBoxView.title = "링키지랩 소개"
        labelForMiximumLines.text = "카카오의 자회사형 장애인 표준사업장 링키지랩은 카카오 플랫폼 서비스 운영, 디지털 접근성 컨설팅 등 IT 특화 업무와 카카오 공동체 사내 카페, 시각장애인 헬스키퍼, 스낵 큐레이션 등 전문적인 사내 복지 사업을 함께 수행하고 있습니다."
        labelForMiximumLines.numberOfLines = 1
        
        [ textFieldForDefault, textFieldForPW, textFieldForNumber, textFieldForEmail ]
            .forEach{ $0.delegate = self }
    }
    
    func configureConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        textViewBoxView.translatesAutoresizingMaskIntoConstraints = false
        [ stackView, textViewBoxView ]
            .forEach{ contentView.addSubview($0) }
        
        [ maximumLinesBoxView, defaultBoxView, pwBoxView, numberBoxView, emailBoxView ]
            .forEach{
                $0.translatesAutoresizingMaskIntoConstraints = false
                stackView.addArrangedSubview($0)
            }
        
        let horizontalInset: CGFloat = 50
        let verticalInset: CGFloat = 50
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: verticalInset),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: horizontalInset),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -horizontalInset),
            
            textViewBoxView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: verticalInset),
            textViewBoxView.heightAnchor.constraint(equalToConstant: CGFloat(300)),
            textViewBoxView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: horizontalInset),
            textViewBoxView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -horizontalInset),
            textViewBoxView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}

