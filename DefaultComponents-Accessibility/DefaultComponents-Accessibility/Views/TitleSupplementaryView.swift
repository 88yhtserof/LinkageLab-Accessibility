//
//  TitleSupplementaryView.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 9/23/24.
//

import UIKit

/// Supplementary view with text for a title of list
class TitleSupplementaryView: UICollectionReusableView {
    var title: String! {
        didSet {
            titleLabel.text = title
        }
    }
    
    private lazy var titleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureSubviews()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: Configuration
private extension TitleSupplementaryView {
    func configureSubviews() {
        titleLabel.font = .systemFont(ofSize: 25, weight: .bold)
    }
    
    func configureConstraints() {
        addPinnedSubview(titleLabel, height: nil)
    }
}
