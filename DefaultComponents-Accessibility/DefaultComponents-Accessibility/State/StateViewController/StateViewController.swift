//
//  StateViewController.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 9/10/24.
//

import UIKit

final class StateViewController: DefaultCollectionViewController {
    
    let imageLoader = ImageLoader()
    
    lazy var progressBoxView = ComponentBoxView([textField, imageView, progressView])
    lazy var switchControl = UISwitch()
    lazy var activityIndicator = UIActivityIndicatorView(style: .large)
    lazy var switchControlWithAccessibility = UISwitch()
    lazy var activityIndicatorWithAccessibility = UIActivityIndicatorView(style: .large)
    lazy var imageView = UIImageView()
    lazy var progressView = UIProgressView(progressViewStyle: .bar)
    lazy var textField = DefaultTextField()
    lazy var activityBoxView = ComponentBoxView([activityIndicator, switchControl])
    lazy var activityBoxViewWithAccessibility = ComponentBoxView([activityIndicatorWithAccessibility, switchControlWithAccessibility])
    
    init() {
        super.init(isAccessible: true)
        
        configureSubViews()
        setPreferredFontyStyle()
        let sections = [
            "ActivityIndicator",
            "Progress"
        ]
        
        let items = [
            Item(sectionID: 0, tag: .standard, title: "액티비티 인디케이터", description: "작업의 진행 상황을 보여주는 컴포넌트입니다.", view: activityBoxView),
            Item(sectionID: 0, tag: .improve, title: "액티비티 인디케이터", description: "활성화 시 해당 컴포넌트로 초점 이동합니다", view: activityBoxViewWithAccessibility),
            Item(sectionID: 1, tag: .standard, title: "프로그래스", description: "시간에 따른 작업 진행 상황을 보여주는 컴포넌트입니다. \n이미지 주소를 입력하고 엔터를 누르십시오.", view: progressBoxView)
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
private extension StateViewController {
    func configureSubViews() {
        activityIndicator.hidesWhenStopped = false
        switchControl.addTarget(self, action: #selector(didToggleSwitch), for: .valueChanged)
        activityIndicatorWithAccessibility.hidesWhenStopped = false
        switchControlWithAccessibility.addTarget(self, action: #selector(didToggleSwitchWithAccessibility), for: .valueChanged)
        activityBoxView.alignment = .leading
        activityBoxViewWithAccessibility.alignment = .leading
        
        textField.placeholderText = "이미지 주소를 입력하세요."
        textField.delegate = self
        imageView.backgroundColor = .systemGray6
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        progressView.progress = Float(0)
        progressView.backgroundColor = .systemGray6
    }
}

extension StateViewController: DynamicTypeable {
    func setPreferredFontyStyle() {
        textField.font = UIFont.preferredFont(forTextStyle: .body)
    }
}
