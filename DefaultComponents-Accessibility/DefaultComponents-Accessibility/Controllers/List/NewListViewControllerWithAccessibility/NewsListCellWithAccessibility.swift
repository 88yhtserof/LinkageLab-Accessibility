//
//  NewsListCellWithAccessibility.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 10/10/24.
//

import UIKit

final class NewsListCellWithAccessibility: ButtonTraitsTableCell {
    
    static let reuseIdentifier = "newslistcellwithaccessibility-identifier"
    
    var title: String? {
        didSet {
            titleLabel.text = title
            accessibilityLabel = title
        }
    }
    
    var content: String? {
        didSet {
            contentLabel.text = content
            accessibilityValue = configureAccessibilityContent()
        }
    }
    
    private lazy var titleLabel = UILabel()
    private lazy var contentLabel = UILabel()
    private lazy var stackView = UIStackView(arrangedSubviews: [titleLabel, contentLabel])
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureSubviews()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension NewsListCellWithAccessibility {
    func configureSubviews() {
        titleLabel.text = title
        titleLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        titleLabel.numberOfLines = 1
        
        contentLabel.text = content
        contentLabel.font = UIFont.preferredFont(forTextStyle: .subheadline)
        contentLabel.numberOfLines = 3
        
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 10
        
        accessibilityHint = "상세 내용을 확인하려면 이중탭 하세요"
        isAccessibilityElement = true
    }
    
    func configureConstraints() {
        contentView.addPinnedSubview(stackView, inset: UIEdgeInsets(top: 20, left: 10, bottom: -20, right: -10), height: nil)
    }
    
    func configureAccessibilityContent() -> String? {
        guard let content else { return nil }
        let partOfcontent = String(content.prefix(80))
        return partOfcontent + " 말줄임"
    }
}
