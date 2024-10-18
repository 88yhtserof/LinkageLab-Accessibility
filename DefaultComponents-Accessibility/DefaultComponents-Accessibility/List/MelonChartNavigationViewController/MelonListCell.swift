//
//  MelonListCell.swift
//  DefaultComponents-Accessibility
//
//  Created by 임윤휘 on 10/18/24.
//

import UIKit

final class MelonListCell: UICollectionViewCell {
    
    var thumbnailImage: UIImage? {
        didSet {
            musicGroupView.thumbnailImage = thumbnailImage
        }
    }
    var text: String! {
        didSet {
            musicGroupView.text = text
        }
    }
    var secondaryText: String? {
        didSet {
            musicGroupView.secondaryText = secondaryText
        }
    }
    
    private lazy var musicGroupView = MusicGroupView(frame: frame)
    private lazy var playButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureSubviews()
        configureContentView()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        musicGroupView.imageView.image = nil
        musicGroupView.textLabel.text = nil
        musicGroupView.secondaryTextLabel.text = nil
    }
    
    @objc func didTapPlayButton() {
        print("Present a Music Player")
    }
}

// MARK: Configuration
private extension MelonListCell {
    func configureSubviews() {
        
        var config = UIButton.Configuration.plain()
        config.image = UIImage(systemName: "play.fill")
        config.baseForegroundColor = .white
        playButton.configuration = config
        playButton.addTarget(self, action: #selector(didTapPlayButton), for: .touchUpInside)
    }
    
    func configureContentView() {
        
    }
    
    func configureConstraints() {
        contentView.addPinnedSubview(musicGroupView, height: nil)
        contentView.addSubviews([playButton])
        
        let spacing: CGFloat = 5.0
        let height = contentView.frame.width
        let horizontalInset: CGFloat = 5.0
        
        NSLayoutConstraint.activate([
            playButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: horizontalInset),
            playButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -horizontalInset)
        ])
    }
}
