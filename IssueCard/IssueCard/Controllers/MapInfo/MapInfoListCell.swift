//
//  MapInfoListCell.swift
//  IssueCard
//
//  Created by 링키지랩 on 10/15/24.
//

import UIKit

final class MapInfoListCell: UICollectionViewCell {
    
    lazy var innerView = UIView()
    var rightView = UIView()
    lazy var imageView = UIImageView()
    lazy var stackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MapInfoListCell {
    func configureView() {
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .leading
        stackView.spacing = 10
        stackView.addArrangedSubview(imageView)
    }
    
    func configureConstraints() {
        contentView.addPinnedSubview(stackView, inset: UIEdgeInsets(top: 10, left: 5, bottom: -10, right: -5), height: nil)
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 25),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor)
        ])
    }
}
