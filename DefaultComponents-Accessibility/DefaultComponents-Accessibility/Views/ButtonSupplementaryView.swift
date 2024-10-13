//
//  ButtonSupplementaryView.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 10/10/24.
//

import UIKit

protocol ButtonSupplementaryViewDelegate: AnyObject {
    func buttonSupplementaryView(didTapButton button: UIButton)
}

/// Supplementary view with button
class ButtonSupplementaryView: UITableViewHeaderFooterView {
    
    static let reuseIndeitifier = "buttonsupplementary_identifier"
    
    weak var delegate: ButtonSupplementaryViewDelegate?
    private var title: String
    private lazy var button = UIButton()
    
    init(title: String) {
        self.title = title
        super.init(reuseIdentifier: ButtonSupplementaryView.reuseIndeitifier)
        
        frame = CGRect(x: 0, y: 0, width: 0, height: 100)
        configureSubviews()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func didTouchInsideButton() {
        delegate?.buttonSupplementaryView(didTapButton: button)
    }
}

//MARK: Configuration
private extension ButtonSupplementaryView {
    func configureSubviews() {
        var config = UIButton.Configuration.plain()
        config.title = title
        button.configuration = config
        button.addTarget(self, action: #selector(didTouchInsideButton), for: .touchUpInside)
    }
    
    func configureConstraints() {
        addPinnedSubview(button, height: nil)
    }
}
