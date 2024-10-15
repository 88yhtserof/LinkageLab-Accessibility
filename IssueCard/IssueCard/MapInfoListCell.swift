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
    private lazy var stackView = UIStackView()
    
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
        stackView.distribution = .fillProportionally
        stackView.spacing = 10
        
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(innerView)
        [ imageView, innerView, rightView ]
            .compactMap{ $0 }
            .forEach{ stackView.addArrangedSubview($0) }
    }
    
    func configureConstraints() {
        contentView.addPinnedSubview(stackView, height: nil)
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 25),
            imageView.heightAnchor.constraint(equalTo
                                              : imageView.widthAnchor)
        ])
    }
}
