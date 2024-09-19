//
//  DefaultTextField.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 9/19/24.
//

import UIKit

class DefaultTextField: UITextField {
    
    var placeholderText: String? {
        didSet {
            placeholder = placeholderText
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        font = .systemFont(ofSize: 20, weight: .regular)
        textAlignment = .left
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = CGFloat(1.0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
