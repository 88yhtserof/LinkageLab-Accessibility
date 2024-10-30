//
//  ScrollView.swift
//  IssueCard
//
//  Created by 링키지랩 on 10/30/24.
//

import UIKit

final class ScrollView: UIScrollView {
    lazy var contentView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addPinnedSubview(contentView, height: nil, equalTo: .init(top: .view, leading: .view, bottom: .view, trailing: .view))
        NSLayoutConstraint.activate([
            contentView.widthAnchor.constraint(equalTo: self.frameLayoutGuide.widthAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
