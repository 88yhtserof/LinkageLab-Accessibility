//
//  RecentListCellWithAccessibility.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 10/29/24.
//

import UIKit

final class RecentListCellWithAccessibility: ButtonTraitsCollectionListCell {
    
    var text: String = "닉네임" {
        didSet {
            textButtonConfig.title = text
            textButton.configuration = textButtonConfig
            textButton.accessibilityLabel = text
            textButton.accessibilityValue = "검색어로 입력"
            deleteButton.accessibilityHint = text
        }
    }
    var deleteAction: (() -> Void)?
    var textAction: ((String) -> Void)?
    
    private var textButtonConfig = UIButton.Configuration.plain()
    private lazy var textButton = UIButton()
    private lazy var deleteButton = UIButton()
    private lazy var stackView = UIStackView(arrangedSubviews: [textButton, deleteButton])
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureContentView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func didTapDeleteButton() {
        deleteAction?()
    }
    
    @objc func didTapTextButton(_ sender: UIButton) {
        guard let searchWord = sender.titleLabel?.text else { return }
        textAction?(searchWord)
    }
}

private extension RecentListCellWithAccessibility {
    func configureContentView() {
        backgroundView = UIView()
        selectedBackgroundView = UIView()
        
        textButtonConfig.baseForegroundColor = .black
        setPreferredFontyStyle()
        textButton.addTarget(self, action: #selector(didTapTextButton), for: .touchUpInside)
        
        let deleteImage = UIImage(systemName: "xmark")
        var config = UIButton.Configuration.plain()
        config.image = deleteImage
        config.baseForegroundColor = .black
        config.buttonSize = .mini
        deleteButton.configuration = config
        deleteButton.addTarget(self, action: #selector(didTapDeleteButton), for: .touchUpInside)
        deleteButton.accessibilityLabel = "제거"
        
        stackView.axis = .horizontal
        stackView.distribution = .fill
        
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 10
        
        contentView.addPinnedSubview(stackView, inset: UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0), height: nil)
    }
}

extension RecentListCellWithAccessibility: DynamicTypeable {
    func setPreferredFontyStyle() {
        textButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: .body)
    }
}
