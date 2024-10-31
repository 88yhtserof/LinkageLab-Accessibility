//
//  PhoneNumberViewWithCopy.swift
//  IssueCard
//
//  Created by 링키지랩 on 10/15/24.
//

import UIKit

final class PhoneNumberViewWithCopy: ActionableLabel {
    
    var phoneNumber: String
    var accessibilityPhoneNumber: String {
        phoneNumber.replacingOccurrences(of: "-", with: " ")
    }
    private var copyRange: NSRange?
    
    init(phoneNumber: String) {
        self.phoneNumber = phoneNumber
        super.init(frame: .zero)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func accessibilityActivate() -> Bool {
        action?(phoneNumber, "전화 걸기")
        return true
    }
    
    @objc func handleTap(_ gesture: UITapGestureRecognizer) {
        let location = gesture.location(in: self)
        
        let textStorage = NSTextStorage(attributedString: self.attributedText!)
        let layoutManager = NSLayoutManager()
        let textContainer = NSTextContainer(size: self.bounds.size)
        textContainer.lineFragmentPadding = 0
        textContainer.lineBreakMode = .byWordWrapping
        layoutManager.addTextContainer(textContainer)
        textStorage.addLayoutManager(layoutManager)
        
        let index = layoutManager.glyphIndex(for: location, in: textContainer)
        
        guard let copyRange else { return }
        if index >= 0 && index < copyRange.lowerBound {
            action?(phoneNumber, "전화 걸기")
        } else if index >= copyRange.lowerBound && index < copyRange.upperBound {
            copyAction()
        }
    }
    
    func copyAction() {
        UIPasteboard.general.string = phoneNumber
    }
    
    func accessibilityCopyRotors() -> UIAccessibilityCustomRotor {
        return UIAccessibilityCustomRotor(name: "복사") { predicate in
            self.copyAction()
            UIAccessibility.post(notification: .announcement, argument: "전화번호 복사됨")
            return UIAccessibilityCustomRotorItemResult()
        }
    }
    
}

private extension PhoneNumberViewWithCopy {
    func configureView() {
        let copyText = " 복사"
        
        let fullText = phoneNumber + copyText
        let attributedString = NSMutableAttributedString(string: fullText)
        copyRange = (fullText as NSString).range(of: copyText)
        attributedString.addAttribute(.foregroundColor, value: UIColor.blue, range: copyRange!)
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        addGestureRecognizer(recognizer)
        isUserInteractionEnabled = true
        attributedText = attributedString
        font = UIFont.preferredFont(forTextStyle: .body)
        
        if UIAccessibility.isVoiceOverRunning {
            isAccessibilityElement = true
            accessibilityLabel = accessibilityPhoneNumber
            accessibilityTraits = .button
            accessibilityCustomRotors = [accessibilityCopyRotors()]
        }
    }
}

