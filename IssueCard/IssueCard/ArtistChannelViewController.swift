//
//  ArtistChannelViewController.swift
//  IssueCard
//
//  Created by 링키지랩 on 10/29/24.
//

import UIKit

final class ArtistChannelViewController: UIViewController {
    
    lazy var scrollView = ScrollView()
    lazy var artistBackgroundImageView = ArtistBackgroundImageView()
    lazy var gradientBackgroundView = GradientTopBackgroundView()
    lazy var artistInfoView = ArtistInfoView()
    
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
        scrollView.contentView.addSubviews([artistBackgroundImageView, gradientBackgroundView, artistInfoView])
        
        view.addPinnedSubview(scrollView, height: nil, equalTo: .init(top: .view, leading: .view, bottom: .view, trailing: .view))
        
        let ratio = artistBackgroundImageView.frame.size.width / artistBackgroundImageView.frame.size.height
        let horizontalInset = CGFloat(15)
        
        NSLayoutConstraint.activate([
            artistBackgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            artistBackgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            artistBackgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            artistBackgroundImageView.heightAnchor.constraint(equalTo: artistBackgroundImageView.widthAnchor, multiplier: ratio),
            
            gradientBackgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            gradientBackgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            gradientBackgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            gradientBackgroundView.topAnchor.constraint(equalTo: artistBackgroundImageView.topAnchor),
            
            artistInfoView.topAnchor.constraint(equalTo: scrollView.contentView.topAnchor, constant: 250),
            artistInfoView.leadingAnchor.constraint(equalTo: scrollView.contentView.leadingAnchor, constant: horizontalInset),
            artistInfoView.trailingAnchor.constraint(equalTo: scrollView.contentView.trailingAnchor, constant: horizontalInset)
        ])
    }
}
