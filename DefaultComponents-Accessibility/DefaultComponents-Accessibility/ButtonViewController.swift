//
//  ButtonViewController.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 9/9/24.
//

import UIKit

final class ButtonViewController: UIViewController {
    
    lazy var textButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSubViews()
        configureView()
        configureConstraints()
    }
}

private extension ButtonViewController {
    func configureSubViews() {
        var configuration = UIButton.Configuration.plain()
        configuration.title = "텍스트 타입"
        textButton.configuration = configuration
    }
    
    func configureView() {
        view.backgroundColor = .systemBackground
    }
    
    func configureConstraints() {
        textButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textButton)
        
        let verticalInset: CGFloat = 20
        let horizontalInset: CGFloat = 10
        
        NSLayoutConstraint.activate([
            textButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: verticalInset),
            textButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: horizontalInset),
            textButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: horizontalInset)
        ])
    }
}
