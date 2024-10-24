//
//  File.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 10/24/24.
//

import UIKit

final class RecentListCell: ButtonTraitsCollectionListCell {
    
    var text: String = "닉네임" {
        didSet {
            textLabel.text = text
        }
    }
    
    private lazy var textLabel = UILabel()
    private lazy var deleteButton = UIButton()
    private lazy var stackView = UIStackView(arrangedSubviews: [textLabel, deleteButton])
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureSubviews()
        configureContentView()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension RecentListCell {
    func configureSubviews() {
        textLabel.text = text
        setPreferredFontyStyle()
        
        let deleteImage = UIImage(systemName: "xmark")
        var config = UIButton.Configuration.plain()
        config.image = deleteImage
        config.baseForegroundColor = .black
        config.buttonSize = .mini
        deleteButton.configuration = config
        
        stackView.axis = .horizontal
        stackView.distribution = .fill
    }
    
    func configureContentView() {
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 10
        backgroundView = UIView()
        sizeToFit()
        
        selectedBackgroundView = UIView()
    }
    
    func configureConstraints(){
        contentView.addPinnedSubview(stackView, inset: UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0), height: nil)
    }
}

extension RecentListCell: DynamicTypeable {
    func setPreferredFontyStyle() {
        textLabel.font = UIFont.preferredFont(forTextStyle: .body)
    }
}
