//
//  NewsListCell.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 10/10/24.
//

import UIKit

final class NewsListCell: UITableViewCell {
    
    static let reuseIdentifier = "newslistcell-identifier"
    
    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
    
    var content: String? {
        didSet {
            contentLabel.text = content
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

private extension NewsListCell {
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
    }
    
    func configureConstraints() {
        contentView.addPinnedSubview(stackView, inset: UIEdgeInsets(top: 20, left: 10, bottom: -20, right: -10), height: nil)
    }
}
