//
//  TextViewController.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 9/9/24.
//

import UIKit

final class TextViewController: UIViewController {
    
    lazy var label = UILabel()
    lazy var textField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSubViews()
        configureView()
        configureConstraints()
    }
}

private extension TextViewController {
    func configureSubViews() {
        label.text = "링키지랩"
        label.font = .systemFont(ofSize: 30)
        label.textColor = .black
        
        textField.font = .systemFont(ofSize: 30)
        textField.placeholder = "원하는 텍스트를 입력하십시오"
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = CGFloat(2.0)
        textField.clearButtonMode = .whileEditing
    }
    
    func configureView() {
        view.backgroundColor = .systemBackground
    }
    
    func configureConstraints() {
        [ label, textField ]
            .forEach{
                $0.translatesAutoresizingMaskIntoConstraints = false
                view.addSubview($0)
            }
        
        let verticalInset: CGFloat = 20
        let horizontalInset: CGFloat = 10
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: verticalInset),
            label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: horizontalInset),
            
            textField.topAnchor.constraint(equalTo: label.bottomAnchor, constant: verticalInset),
            textField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: horizontalInset),
            textField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -horizontalInset)
        ])
    }
}
