//
//  ActivityIndicatorWithSwitchViewController.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 9/10/24.
//

import UIKit

final class ActivityIndicatorWithSwitchViewController: UIViewController {
    
    lazy var switchControl = UISwitch()
    
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
        
    }
    
    func configureView() {
        view.backgroundColor = .systemBackground
    }
    
    func configureConstraints() {
        [ switchControl ]
            .forEach{
                $0.translatesAutoresizingMaskIntoConstraints = false
                view.addSubview($0)
            }
        
        let verticalInset: CGFloat = 20
        let horizontalInset: CGFloat = 10
        
        NSLayoutConstraint.activate([
            switchControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: verticalInset),
            switchControl.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ])
    }
}
