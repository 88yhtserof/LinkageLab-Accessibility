//
//  StateViewController.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 9/10/24.
//

import UIKit

final class StateViewController: DefaultWithScrollViewController {
    
    let imageLoader = ImageLoader()
    
    lazy var progressBoxView = ComponentBoxView([textField, imageView, progressView])
    lazy var switchControl = UISwitch()
    lazy var activityIndicator = UIActivityIndicatorView(style: .large)
    lazy var switchControlWithAccessibility = UISwitch()
    lazy var activityIndicatorWithAccessibility = UIActivityIndicatorView(style: .large)
    lazy var imageView = UIImageView()
    lazy var progressView = UIProgressView(progressViewStyle: .bar)
    lazy var textField = DefaultTextField()
    lazy var activityStack = UIStackView()
    lazy var activityBoxView = ComponentBoxView([activityIndicator, switchControl])
    lazy var activityBoxViewWithAccessibility = ComponentBoxView([activityIndicatorWithAccessibility, switchControlWithAccessibility])
    
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
private extension StateViewController {
    func configureSubViews() {
        activityIndicator.hidesWhenStopped = false
        switchControl.addTarget(self, action: #selector(didToggleSwitch), for: .valueChanged)
        activityIndicatorWithAccessibility.hidesWhenStopped = false
        switchControlWithAccessibility.addTarget(self, action: #selector(didToggleSwitchWithAccessibility), for: .valueChanged)
        
        textField.placeholderText = "이미지 주소를 입력하세요."
        textField.delegate = self
        imageView.backgroundColor = .systemGray6
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        progressView.progress = Float(0)
        progressView.backgroundColor = .systemGray6
        
        activityStack.axis = .horizontal
        activityStack.distribution = .fillEqually
    }
    
    func configureConstraints() {
        
        [ activityBoxView, activityBoxViewWithAccessibility ]
            .forEach{ activityStack.addArrangedSubview($0) }
        
        [ activityStack, progressBoxView ]
            .forEach{
                $0.translatesAutoresizingMaskIntoConstraints = false
                contentView.addSubview($0)
            }
        
        let verticalInset: CGFloat = 50
        let horizontalInset: CGFloat = 50
        
        NSLayoutConstraint.activate([
            activityStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: verticalInset),
            activityStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: horizontalInset),
            activityStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -horizontalInset),
            
            progressBoxView.topAnchor.constraint(equalTo: activityStack.bottomAnchor, constant: verticalInset),
            progressBoxView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: horizontalInset),
            progressBoxView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -horizontalInset),
            progressView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -verticalInset),
            
            imageView.heightAnchor.constraint(equalToConstant: CGFloat(200))
        ])
    }
}
