//
//  ActivityIndicatorWithSwitchViewController.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 9/10/24.
//

import UIKit

final class ActivityIndicatorWithSwitchViewController: UIViewController {
    
    lazy var switchControl = UISwitch()
    lazy var activityIndicator = UIActivityIndicatorView(style: .large)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSubViews()
        configureView()
        configureConstraints()
    }
}

// MARK: Configuration
private extension ActivityIndicatorWithSwitchViewController {
    func configureSubViews() {
        activityIndicator.hidesWhenStopped = false
        
        switchControl.addTarget(self, action: #selector(didToggleSwitch), for: .valueChanged)
    }
    
    func configureView() {
        view.backgroundColor = .systemBackground
    }
    
    func configureConstraints() {
        [ activityIndicator, switchControl ]
            .forEach{
                $0.translatesAutoresizingMaskIntoConstraints = false
                view.addSubview($0)
            }
        
        let verticalInset: CGFloat = 50
        
        NSLayoutConstraint.activate([
            activityIndicator.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: verticalInset),
            activityIndicator.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            switchControl.topAnchor.constraint(equalTo: activityIndicator.bottomAnchor, constant: verticalInset),
            switchControl.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ])
    }
}
