//
//  ArtistListViewController.swift
//  IssueCard
//
//  Created by 링키지랩 on 11/7/24.
//

import UIKit

class ArtistListViewController: UIViewController {
    
    private lazy var aespaChannelButton = UIButton()
    private lazy var stackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [aespaChannelButton])
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
        let vc = ArtistChannelViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

private extension ArtistListViewController {
    
    func configureSubviews() {
        var buttonConfig = UIButton.Configuration.filled()
        buttonConfig.baseBackgroundColor = .black
        buttonConfig.title = "에스파 채널"
        aespaChannelButton.configuration = buttonConfig
        aespaChannelButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
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

