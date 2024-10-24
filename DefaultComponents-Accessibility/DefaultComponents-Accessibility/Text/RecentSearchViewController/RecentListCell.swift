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
    
    var identifier: String {
        get { self.text }
        set {}
    }
    var deleteAction: ((String) -> Void)?
    var isEmptyCell = false {
        didSet {
            configureCotentView()
        }
    }
    
    private lazy var emptyLabel = UILabel()
    private lazy var textLabel = UILabel()
    private lazy var deleteButton = UIButton()
    private lazy var stackView = UIStackView(arrangedSubviews: [textLabel, deleteButton])
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureCotentView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func didTapDeleteButton() {
        deleteAction?(identifier)
    }
}

private extension RecentListCell {
    func configureCotentView() {
        if isEmptyCell {
            configureEmptyCell()
        } else {
            configureStardCell()
        }
        
        backgroundView = UIView()
        selectedBackgroundView = UIView()
    }
    
    func configureStardCell() {
        textLabel.text = text
        setPreferredFontyStyle()
        
        let deleteImage = UIImage(systemName: "xmark")
        var config = UIButton.Configuration.plain()
        config.image = deleteImage
        config.baseForegroundColor = .black
        config.buttonSize = .mini
        deleteButton.configuration = config
        deleteButton.addTarget(self, action: #selector(didTapDeleteButton), for: .touchUpInside)
        
        stackView.axis = .horizontal
        stackView.distribution = .fill
        
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 10
        
        contentView.addPinnedSubview(stackView, inset: UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0), height: nil)
    }
    
    func configureEmptyCell() {
        emptyLabel.text = "검색 내역이 없습니다"
        setPreferredFontyStyle()
        
        [ textLabel, deleteButton ]
            .forEach{ $0.isHidden = true }
        contentView.backgroundColor = nil
        contentView.addPinnedSubview(emptyLabel, height: nil)
    }
}

extension RecentListCell: DynamicTypeable {
    func setPreferredFontyStyle() {
        if isEmptyCell {
            emptyLabel.font = UIFont.preferredFont(forTextStyle: .body)
        } else {
            textLabel.font = UIFont.preferredFont(forTextStyle: .body)
        }
    }
}
