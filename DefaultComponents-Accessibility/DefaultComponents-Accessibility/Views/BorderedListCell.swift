//
//  BorderedListCell.swift
//  DefaultComponents-Accessibility
//
//  Created by 임윤휘 on 10/14/24.
//

import UIKit

class BorderedListCell: UICollectionViewCell, Identifiable {
    typealias ID = String?
    
    weak var delegate: AdjustableForAccessibility?
    
    var id: String?
    
    var rank: Int! {
        didSet {
            rankLabel.text = String(rank)
        }
    }
    var text: String! {
        didSet {
            textLabel.text = text
        }
    }
    
    private lazy var rankLabel = UILabel()
    private lazy var textLabel = UILabel()
    
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
    
    override func prepareForReuse() {
        super.prepareForReuse()
        rankLabel.text = nil
        textLabel.text = nil
    }
    
    override func accessibilityIncrement() {
        delegate?.adjustableIncrement(self)
        
    }
    
    override func accessibilityDecrement() {
        delegate?.adjustableDecrement(self)
    }

}

// MARK: Configuration
private extension BorderedListCell {
    func configureSubviews() {
        
        rankLabel.sizeToFit()
        rankLabel.isAccessibilityElement = false
        
        textLabel.isAccessibilityElement = false
        textLabel.textAlignment = .left
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.black.cgColor
    }
    
    func configureContentView() {
        contentView.addSubviews([rankLabel, textLabel])
    }
    
    func configureConstraints() {
        let spacing: CGFloat = 5.0
        
        NSLayoutConstraint.activate([
            rankLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: spacing),
            rankLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            
            textLabel.centerYAnchor.constraint(equalTo: rankLabel.centerYAnchor),
            textLabel.leadingAnchor.constraint(equalTo: rankLabel.trailingAnchor, constant: 10),
            textLabel.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor)
        ])
    }
}

extension BorderedListCell: DynamicTypeable {
    func setPreferredFontyStyle() {
        rankLabel.font = UIFont.preferredFont(forTextStyle: .body)
        textLabel.font = UIFont.preferredFont(forTextStyle: .footnote)
    }
}
