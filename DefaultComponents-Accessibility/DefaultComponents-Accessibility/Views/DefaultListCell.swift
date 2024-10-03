//
//  DefaultListCell.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 10/2/24.
//

import UIKit

class DefaultListCell: UICollectionViewCell {
    
    lazy var view = UIView()
    lazy var textLabel = UILabel()
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
        textLabel.font = .systemFont(ofSize: 18, weight: .regular)
        textLabel.numberOfLines = 0
        tagLabel.font = .systemFont(ofSize: 18, weight: .bold)
        tagLabel.backgroundColor = .yellow
        
        addSubviews([ tagLabel, textLabel, view ])
        
        NSLayoutConstraint.activate([
            tagLabel.topAnchor.constraint(equalTo: topAnchor),
            tagLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            textLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            textLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            textLabel.topAnchor.constraint(equalTo: tagLabel.bottomAnchor, constant: 5),
            
            view.leadingAnchor.constraint(equalTo: leadingAnchor),
            view.trailingAnchor.constraint(equalTo: trailingAnchor),
            view.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 15),
            view.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
