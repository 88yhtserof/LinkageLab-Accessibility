//
//  PhoneNumberView.swift
//  IssueCard
//
//  Created by 링키지랩 on 10/16/24.
//

import UIKit

final class PhoneNumberView: ActionableLabel {
    
    var phoneNumber: String
    var accessibilityPhoneNumber: String {
        phoneNumber.replacingOccurrences(of: "-", with: " ")
    }
    
    init(phoneNumber: String) {
        self.phoneNumber = phoneNumber
        super.init(frame: .zero)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        if let action {
            action(phoneNumber, "전화 걸기")
        }
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
        
        accessibilityLabel = accessibilityPhoneNumber
        accessibilityTraits = .button
        text = phoneNumber
        font = UIFont.preferredFont(forTextStyle: .body)
    }
}
