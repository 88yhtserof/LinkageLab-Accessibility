//
//  PhoneNumberView.swift
//  IssueCard
//
//  Created by 링키지랩 on 10/15/24.
//

import UIKit

protocol PhoneNumberViewDelegate: AnyObject {
    func didTapPhoneNumber(title: String, actionTitle: String)
}

final class PhoneNumberView: UIView, Actionable {
    
    var phoneNumber: String
    var accessibilityPhoneNumber: String {
        phoneNumber.replacingOccurrences(of: "-", with: " ")
    }
    var action: ((String, String) -> Void)?
    
    private lazy var phoneNumberLabel = UILabel()
    
    init(phoneNumber: String) {
        self.phoneNumber = phoneNumber
        super.init(frame: .zero)
        configureView()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func accessibilityActivate() -> Bool {
        if let action {
            action(phoneNumber, "전화 걸기")
        }
        return true
    }
    
}

private extension PhoneNumberView {
    func configureView() {
        let copyText = " 복사"
        
        isAccessibilityElement = true
        accessibilityLabel = accessibilityPhoneNumber
        accessibilityTraits = .button
        let fullText = phoneNumber + copyText
        let attributedString = NSMutableAttributedString(string: fullText)
        let range = (fullText as NSString).range(of: copyText)
        attributedString.addAttribute(.foregroundColor, value: UIColor.blue, range: range)
        
        phoneNumberLabel.attributedText = attributedString
        phoneNumberLabel.font = UIFont.preferredFont(forTextStyle: .body)
    }
    
    func configureConstraints() {
        addPinnedSubview(phoneNumberLabel, height: nil)
        
    }
}
