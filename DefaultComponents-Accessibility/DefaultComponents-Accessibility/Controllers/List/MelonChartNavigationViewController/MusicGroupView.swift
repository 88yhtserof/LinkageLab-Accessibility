//
//  MusicGroupView.swift
//  DefaultComponents-Accessibility
//
//  Created by 임윤휘 on 10/18/24.
//

import UIKit

final class MusicGroupView: UIControl {
    
    var thumbnailImage: UIImage? {
        didSet {
            imageView.image = thumbnailImage
        }
    }
    var text: String! {
        didSet {
            textLabel.text = text
        }
    }
    var secondaryText: String? {
        didSet {
            secondaryTextLabel.text = secondaryText
        }
    }
    
    lazy var imageView = UIImageView()
    lazy var textLabel = UILabel()
    lazy var secondaryTextLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureSubviews()
        setPreferredFontyStyle()
        configureContentView()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Configuration
private extension MusicGroupView {
    func configureSubviews() {
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = .darkGray
        
        textLabel.font = .systemFont(ofSize: 15, weight: .regular)
        secondaryTextLabel.font = .systemFont(ofSize: 15, weight: .thin)
    }
    
    func configureContentView() {
        isUserInteractionEnabled = true
    }
    
    func configureConstraints() {
        addSubviews([imageView, textLabel, secondaryTextLabel])
        
        let spacing: CGFloat = 5.0
        let height = frame.width
        
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: height),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.topAnchor.constraint(equalTo: topAnchor),
            
            textLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: spacing),
            textLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            textLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            secondaryTextLabel.topAnchor.constraint(equalTo: textLabel.bottomAnchor),
            secondaryTextLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            secondaryTextLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            secondaryTextLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

extension MusicGroupView: DynamicTypeable {
    func setPreferredFontyStyle() {
        textLabel.font = UIFont.preferredFont(forTextStyle: .body)
        secondaryTextLabel.font = UIFont.preferredFont(forTextStyle: .footnote)
    }
}
