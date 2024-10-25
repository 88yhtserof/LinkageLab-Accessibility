//
//  RecentEmptyListCell.swift
//  DefaultComponents-Accessibility
//
//  Created by 임윤휘 on 10/25/24.
//


import UIKit

final class RecentEmptyListCell: ButtonTraitsCollectionListCell {

    private lazy var emptyLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureEmptyCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension RecentEmptyListCell {
    
    func configureEmptyCell() {
        emptyLabel.text = "검색 내역이 없습니다"
        setPreferredFontyStyle()
        backgroundView = UIView()
        selectedBackgroundView = UIView()
        contentView.addPinnedSubview(emptyLabel, height: nil)
    }
}

extension RecentEmptyListCell: DynamicTypeable {
    func setPreferredFontyStyle() {
        emptyLabel.font = UIFont.preferredFont(forTextStyle: .body)
    }
}
