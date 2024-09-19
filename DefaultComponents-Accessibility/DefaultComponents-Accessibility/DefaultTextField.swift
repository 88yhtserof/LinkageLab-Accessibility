//
//  DefaultTextField.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 9/19/24.
//

import UIKit

class DefaultTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        font = .systemFont(ofSize: 20, weight: .regular)
        placeholder = "원하는 데이터를 입력하세요."
        textAlignment = .left
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = CGFloat(1.0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
