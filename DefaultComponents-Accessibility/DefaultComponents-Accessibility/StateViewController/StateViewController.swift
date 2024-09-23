//
//  StateViewController.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 9/10/24.
//

import UIKit

final class StateViewController: UIViewController {
    
    var navigationTitle: String? {
        didSet {
            navigationItem.title = navigationTitle
        }
    }
    let imageLoader = ImageLoader()
    
    lazy var progressBoxView = ComponentBoxView([textField, imageView, progressView])
    lazy var switchControl = UISwitch()
    lazy var activityIndicator = UIActivityIndicatorView(style: .large)
    lazy var imageView = UIImageView()
    lazy var progressView = UIProgressView(progressViewStyle: .bar)
    lazy var textField = DefaultTextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSubViews()
        configureView()
        configureConstraints()
    }
}

// MARK: Configuration
private extension StateViewController {
    func configureSubViews() {
        activityIndicator.hidesWhenStopped = false
        switchControl.addTarget(self, action: #selector(didToggleSwitch), for: .valueChanged)
        
        textField.placeholderText = "이미지 주소를 입력하세요."
        textField.delegate = self
        imageView.backgroundColor = .systemGray6
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        progressView.progress = Float(0)
        progressView.backgroundColor = .systemGray6
    }
    
    func configureView() {
        view.backgroundColor = .systemBackground
    }
    
    func configureConstraints() {
        [ activityIndicator, switchControl, progressBoxView ]
            .forEach{
                $0.translatesAutoresizingMaskIntoConstraints = false
                view.addSubview($0)
            }
        
        let verticalInset: CGFloat = 50
        let horizontalInset: CGFloat = 50
        
        NSLayoutConstraint.activate([
            activityIndicator.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: verticalInset),
            activityIndicator.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            switchControl.topAnchor.constraint(equalTo: activityIndicator.bottomAnchor, constant: verticalInset),
            switchControl.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            progressBoxView.topAnchor.constraint(equalTo: switchControl.bottomAnchor, constant: verticalInset),
            progressBoxView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: horizontalInset),
            progressBoxView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -horizontalInset),
            imageView.heightAnchor.constraint(equalToConstant: CGFloat(200))
        ])
    }
}
