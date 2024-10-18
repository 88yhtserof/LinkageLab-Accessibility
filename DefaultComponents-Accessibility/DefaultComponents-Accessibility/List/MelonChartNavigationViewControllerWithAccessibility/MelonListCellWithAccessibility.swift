//
//  MelonListCellWithAccessibility.swift
//  DefaultComponents-Accessibility
//
//  Created by 임윤휘 on 10/18/24.
//

import UIKit

final class MelonListCellWithAccessibility: UICollectionViewCell {
    
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
    weak var delegate: AdjustableForAccessibility?
    
    lazy var musicGroupView = MusicGroupView(frame: frame)
    lazy var playButton = UIButton()
    
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
    
    override func accessibilityIncrement() {
        delegate?.adjustableIncrement(self)
        
    }
    
    override func accessibilityDecrement() {
        delegate?.adjustableDecrement(self)
    }
}

// MARK: Configuration
private extension MelonListCellWithAccessibility {
    func configureSubviews() {
        
        var config = UIButton.Configuration.plain()
        config.image = UIImage(systemName: "play.fill")
        config.baseForegroundColor = .white
        playButton.configuration = config
    }
    
    func configureContentView() {
        
    }
    
    func configureConstraints() {
        contentView.addPinnedSubview(musicGroupView, height: nil)
        contentView.addSubviews([playButton])
        
        let horizontalInset: CGFloat = 5.0
        
        NSLayoutConstraint.activate([
            playButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: horizontalInset),
            playButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -horizontalInset)
        ])
    }
}
