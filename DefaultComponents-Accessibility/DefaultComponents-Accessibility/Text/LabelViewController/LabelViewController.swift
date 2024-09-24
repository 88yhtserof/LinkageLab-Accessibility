//
//  LabelViewController.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 9/19/24.
//

import UIKit

final class LabelViewController: DefaultViewController {

    private lazy var singleLineBoxView = ComponentBoxView([labelForsingleLine])
    private lazy var multipleLineBoxView = ComponentBoxView([labelForMultipleLine])
    private lazy var maximumLinesBoxView = ComponentBoxView([labelForMiximumLines])
    
    private lazy var labelForsingleLine = UILabel()
    private lazy var labelForMultipleLine = UILabel()
    private lazy var labelForMiximumLines = UILabel()
    private lazy var stackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSubViews()
        configureConstraints()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.becomeFirstResponder()
    }
}

// MARK: Configuration
private extension LabelViewController {
    func configureSubViews() {
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 20
        
        labelForsingleLine.text = "한 줄의 텍스트 컴포넌트입니다."
        labelForMultipleLine.text = "여러 줄의 텍스트 컴포넌트입니다. \n 여러 줄의 텍스트 컴포넌트입니다. \n 여러 줄의 텍스트 컴포넌트입니다."
        labelForMiximumLines.text = "최대 라인의 수가 1줄인 텍스트 컴포넌트입니다."
        labelForMiximumLines.numberOfLines = 1
        
        singleLineBoxView.title = "한 줄"
        multipleLineBoxView.title = "여러 줄"
        maximumLinesBoxView.title = "최대 라인 수 설정"
    }
    
    func configureConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        [ singleLineBoxView, multipleLineBoxView, maximumLinesBoxView ]
            .forEach{
                $0.translatesAutoresizingMaskIntoConstraints = false
                stackView.addArrangedSubview($0)
            }
        
        let horizontalInset: CGFloat = 50
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: horizontalInset),
            stackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -horizontalInset)
        ])
    }
}
