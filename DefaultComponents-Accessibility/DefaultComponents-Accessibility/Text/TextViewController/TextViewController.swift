//
//  TextViewController.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 9/19/24.
//


import UIKit

final class TextViewController: DefaultCollectionViewController {
    
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
    
    init() {
        super.init(isAccessible: true)
        
        configureSubViews()
        let sections = [
            "UILabel",
            "UITextField",
            "UITextView"
        ]
        
        let items = [
            Item(sectionID: 0, tag: .standard, description: "텍스트 길이 조건이 있는 컴포넌트입니다.", view: maximumLinesBoxView),
            Item(sectionID: 1, tag: .standard,description: "한 줄을 입력할 수 있는 텍스트 입력창입니다.", view: defaultBoxView),
            Item(sectionID: 1, tag: .standard, description: "암호를 입력하는 텍스트 입력창입니다.", view: pwBoxView),
            Item(sectionID: 1, tag: .standard,description: "숫자를 입력하는 텍스트 입력창입니다.", view: numberBoxView),
            Item(sectionID: 1, tag: .standard,description: "이메일을 입력하는 텍스트 입력창입니다.", view: emailBoxView),
            Item(sectionID: 2, tag: .standard,description: "여러 줄을 입력할 수 있는 텍스트 입력창입니다.", view: textViewBoxView)
        ]
        super.sections = sections
        super.items = items
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerKeyboardNotifications()
    }
    
    deinit {
        removeKeyboardNotification()
    }
}

// MARK: Configuration
private extension TextViewController {
    func configureSubViews() {
        
        textFieldForDefault.placeholderText = "예: 홍길동"
        textFieldForPW.isSecureTextEntry = true
        textFieldForPW.placeholderText = "8 ~16자 영문 대 소문자, 숫자, 특수문자를 이용하세요"
        textFieldForNumber.keyboardType = .numberPad
        textFieldForNumber.placeholderText = "예: 1234"
        textFieldForEmail.keyboardType = .emailAddress
        textFieldForEmail.placeholderText = "예: default@email.com"
        textView.font = .systemFont(ofSize: 20)
        textView.backgroundColor = .systemGray6
        textView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        defaultBoxView.title = "이름"
        pwBoxView.title = "비밀번호"
        numberBoxView.title = "인증번호"
        emailBoxView.title = "이메일"
        textViewBoxView.title = "문의글 남기기"
        
        maximumLinesBoxView.title = "링키지랩 소개"
        labelForMiximumLines.text = "카카오의 자회사형 장애인 표준사업장 링키지랩은 카카오 플랫폼 서비스 운영, 디지털 접근성 컨설팅 등 IT 특화 업무와 카카오 공동체 사내 카페, 시각장애인 헬스키퍼, 스낵 큐레이션 등 전문적인 사내 복지 사업을 함께 수행하고 있습니다."
        labelForMiximumLines.numberOfLines = 1
        
        [ textFieldForDefault, textFieldForPW, textFieldForNumber, textFieldForEmail ]
            .forEach{ $0.delegate = self }
    }
}

