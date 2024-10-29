//
//  ArtistChannelViewController.swift
//  IssueCard
//
//  Created by 링키지랩 on 10/29/24.
//

import UIKit

final class ArtistChannelViewController: UIViewController {
    lazy var artistBackgroundImageView: UIImageView = {
        let image = UIImage(named: "aespa_1")
        var view = UIImageView(image: image)
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        configureConstraints()
    }
}

private extension ArtistChannelViewController {
    
    func configureView() {
        view.backgroundColor = .white
    }
    
    func configureConstraints() {
        view.addSubviews([artistBackgroundImageView])
        
        NSLayoutConstraint.activate([
            artistBackgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            artistBackgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            artistBackgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
