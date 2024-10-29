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
        view.contentMode = .scaleToFill
        return view
    }()
    
    lazy var gradientBackgroundView = GradientTopBackgroundView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        configureConstraints()
    }
}

private extension ArtistChannelViewController {
    
    func configureView() {
//        view.backgroundColor = .white
    }
    
    func configureConstraints() {
        view.addSubviews([artistBackgroundImageView, gradientBackgroundView])
        let ratio = artistBackgroundImageView.frame.size.width / artistBackgroundImageView.frame.size.height
        
        NSLayoutConstraint.activate([
            artistBackgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            artistBackgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            artistBackgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            artistBackgroundImageView.heightAnchor.constraint(equalTo: artistBackgroundImageView.widthAnchor, multiplier: ratio),
            
            gradientBackgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            gradientBackgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            gradientBackgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            gradientBackgroundView.topAnchor.constraint(equalTo: artistBackgroundImageView.topAnchor)
        ])
    }
}
