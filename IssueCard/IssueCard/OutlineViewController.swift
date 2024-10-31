//
//  OutlineViewController.swift
//  IssueCard
//
//  Created by 링키지랩 on 10/15/24.
//

import UIKit

class OutlineViewController: UIViewController {
    
    private lazy var mapInfoButton = UIButton()
    private lazy var artistChannelButton = UIButton()
    private lazy var stackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [mapInfoButton, artistChannelButton])
        view.axis = .vertical
        view.distribution = .fill
        view.spacing = 15
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureSubviews()
        configureView()
        configureConstraints()
    }
    
    @objc func didTapButton(_ sender: UIButton) {
        var vc: UIViewController
        
        if sender == mapInfoButton {
            vc = MapInfoViewController()
        } else {
            vc = TabBarController()
        }
        
        navigationController?.pushViewController(vc, animated: true)
    }
}

private extension OutlineViewController {
    
    func configureSubviews() {
        var buttonConfig = UIButton.Configuration.filled()
        buttonConfig.baseBackgroundColor = .black
        
        buttonConfig.title = "이슈2: 전화번호 복사"
        mapInfoButton.configuration = buttonConfig
        mapInfoButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        buttonConfig.title = "이슈3: 초점 접근 순서"
        artistChannelButton.configuration = buttonConfig
        artistChannelButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    func configureView() {
        view.backgroundColor = .white
    }
    
    func configureConstraints() {
        view.addSubviews([stackView])
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

