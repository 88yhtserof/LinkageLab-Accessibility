//
//  DefaultListCell.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 10/2/24.
//

import UIKit

class DefaultListCell: UICollectionViewCell {
    
    lazy var view = UIView()
    lazy var titleLabel = UILabel()
    lazy var subtitleLabel = UILabel()
    lazy var tagLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureConstraints()
        contentView.isUserInteractionEnabled = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: Configuration
private extension DefaultListCell {
    func configureConstraints() {
        titleLabel.font = .systemFont(ofSize: 20, weight: .bold)
        subtitleLabel.font = .systemFont(ofSize: 18, weight: .regular)
        subtitleLabel.numberOfLines = 0
        tagLabel.font = .systemFont(ofSize: 16, weight: .regular)
        tagLabel.backgroundColor = .yellow
        
        addSubviews([ titleLabel, tagLabel, subtitleLabel, view ])
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            
            tagLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            tagLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            subtitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            subtitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            subtitleLabel.topAnchor.constraint(equalTo: tagLabel.bottomAnchor, constant: 5),
            
            view.leadingAnchor.constraint(equalTo: leadingAnchor),
            view.trailingAnchor.constraint(equalTo: trailingAnchor),
            view.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 15),
            view.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
