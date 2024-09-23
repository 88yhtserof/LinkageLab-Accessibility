//
//  SheetViewController.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 9/23/24.
//

import UIKit

final class SheetViewController: UIViewController {
    
    var navigationTitle: String? {
        didSet {
            navigationItem.title = navigationTitle
        }
    }
    
    private var presentButton = UIButton()
    private var stackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSubviews()
        configureView()
        configureConstraints()
    }
}

// MARK: Configuration
extension SheetViewController {
    func configureSubviews() {
        var config = UIButton.Configuration.filled()
        config.title = "화면 Present"
        presentButton.configuration = config
        presentButton.addTarget(self, action: #selector(didTapPresentButton), for: .touchUpInside)
        
        stackView.axis = .vertical
        stackView.spacing = 10
    }
    
    func configureView() {
        view.backgroundColor = .white
    }
    
    func configureConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        [ presentButton ]
            .forEach{ stackView.addArrangedSubview($0) }
        
        let horizontalInset: CGFloat = 40
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: horizontalInset),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -horizontalInset)
        ])
    }
}
