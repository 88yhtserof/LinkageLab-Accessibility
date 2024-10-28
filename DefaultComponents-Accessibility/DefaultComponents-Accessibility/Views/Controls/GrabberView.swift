//
//  GrabberView.swift
//  DefaultComponents-Accessibility
//
//  Created by 임윤휘 on 10/3/24.
//

import UIKit

final class GrabberView: UIControl {
    
    private lazy var grabber = UIView()
    var actionAccessibility: (() -> Void)?
    
    init() {
        super.init(frame: .zero)
        
        accessibilityTraits = .button
        accessibilityHint = "시트를 확장하려면 이중 탭하십시오"
        
        grabber.backgroundColor = .darkGray
        grabber.layer.cornerRadius = 2
        grabber.layer.borderColor = UIColor.black.cgColor
        grabber.layer.borderWidth = 1
        
        
        translatesAutoresizingMaskIntoConstraints = false
        grabber.translatesAutoresizingMaskIntoConstraints = false
        addSubviews([grabber])
        
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: 300),
            heightAnchor.constraint(equalToConstant: 15),
            
            grabber.widthAnchor.constraint(equalToConstant: 30),
            grabber.heightAnchor.constraint(equalToConstant: 6),
            grabber.centerXAnchor.constraint(equalTo: centerXAnchor),
            grabber.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func accessibilityActivate() -> Bool {
        guard let actionAccessibility else { return false }
        actionAccessibility()
        return true
    }
}
