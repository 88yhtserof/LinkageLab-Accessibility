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
    lazy var textView = UITextView()
    lazy var copyButton = UIButton()
    lazy var pasteControl = UIPasteControl(configuration: pasteControlConfiguration)
    
    private var pasteControlConfiguration = UIPasteControl.Configuration()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSubViews()
        configureView()
        configureConstraints()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        if textField.isFirstResponder {
            textField.resignFirstResponder()
        } else if textView.isFirstResponder {
            textView.resignFirstResponder()
        }
    }
    
    @objc func didSelectCopyButton(_ sender: UIButton) {
        UIPasteboard.general.string = textField.text
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
        
        var copyButtonConfiguration = UIButton.Configuration.filled()
        copyButtonConfiguration.title = "복사하기"
        copyButtonConfiguration.baseBackgroundColor = .blue
        copyButtonConfiguration.baseForegroundColor = .white
        copyButton.configuration = copyButtonConfiguration
        copyButton.addTarget(self, action: #selector(didSelectCopyButton), for: .touchUpInside)
        
        pasteControlConfiguration = UIPasteControl.Configuration()
        pasteControlConfiguration.baseBackgroundColor = .black
        pasteControlConfiguration.baseForegroundColor = .white
        pasteControlConfiguration.displayMode = .iconAndLabel
        pasteControlConfiguration.cornerStyle = .capsule
        pasteControl.target = textView
        
        textView.font = .systemFont(ofSize: 20)
        textView.backgroundColor = .systemGray6
    }
    
    func configureView() {
        view.backgroundColor = .systemBackground
    }
    
    func configureConstraints() {
        [ label, copyButton, textField, textView, pasteControl ]
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
            textField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -horizontalInset),
            
            copyButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: verticalInset),
            copyButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: horizontalInset),
            copyButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -horizontalInset),
            
            textView.topAnchor.constraint(equalTo: copyButton.bottomAnchor, constant: verticalInset),
            textView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: horizontalInset),
            textView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -horizontalInset),
            
            pasteControl.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: verticalInset),
            pasteControl.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: horizontalInset),
            pasteControl.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -horizontalInset),
            pasteControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -verticalInset),
        ])
    }
}
