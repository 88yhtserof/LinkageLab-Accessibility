//
//  DefaultListCell.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 10/2/24.
//

import UIKit

class DefaultListCell: UICollectionViewCell, Identifiable {
    
    var id: UUID?
    
    lazy var view = UIView()
    lazy var titleLabel = UILabel()
    lazy var subtitleLabel = UILabel()
    lazy var tagLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureConstraints()
        setPreferredFontyStyle()
        contentView.isUserInteractionEnabled = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        view.subviews
            .forEach{ $0.removeFromSuperview() }
        titleLabel.text = nil
        subtitleLabel.text = nil
        tagLabel.text = nil
    }

}

// MARK: Configuration
private extension DefaultListCell {
    func configureConstraints() {
        subtitleLabel.numberOfLines = 0
        tagLabel.backgroundColor = .yellow
        
        addSubviews([ titleLabel, tagLabel, subtitleLabel, view ])
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            titleLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 30),
            
            tagLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            tagLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            tagLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 30),
            
            subtitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            subtitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            subtitleLabel.topAnchor.constraint(equalTo: tagLabel.bottomAnchor, constant: 5),
            subtitleLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 30),
            
            view.leadingAnchor.constraint(equalTo: leadingAnchor),
            view.trailingAnchor.constraint(equalTo: trailingAnchor),
            view.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 15),
            view.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

extension DefaultListCell: DynamicTypeable {
    func setPreferredFontyStyle() {
        titleLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        tagLabel.font = UIFont.preferredFont(forTextStyle: .footnote)
        subtitleLabel.font = UIFont.preferredFont(forTextStyle: .subheadline)
    }
}
