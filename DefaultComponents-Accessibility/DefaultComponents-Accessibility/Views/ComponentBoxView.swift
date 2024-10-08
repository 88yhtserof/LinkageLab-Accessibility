//
//  ComponentBoxView.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 9/19/24.
//

import UIKit

/// View to be used as the basic structure  of a component
class ComponentBoxView: UIView {
    
    var actionForAccessibility: (() -> Void)?
    
    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
    
    var axis: NSLayoutConstraint.Axis = .vertical {
        didSet {
            stackView.axis = axis
        }
    }
    
    var alignment: UIStackView.Alignment = .fill {
        didSet {
            stackView.alignment = alignment
        }
    }
    
    var componenets: [UIView]?
    private lazy var stackView = UIStackView()
    private lazy var titleLabel = UILabel()
    
    init(_ components: [UIView]?) {
        self.componenets = components
        
        super.init(frame: .zero)
        configurationSubViews()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func accessibilityActivate() -> Bool {
        guard let action = actionForAccessibility else { return false }
        action()
        return true
    }
}

// MARK: Configuration
extension ComponentBoxView {
    func configurationSubViews() {
        stackView.axis = axis
        stackView.distribution = .fill
        stackView.spacing = 10
        
        titleLabel.font = .systemFont(ofSize: 20, weight: .regular)
    }
    
    func configureConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        
        var views: [UIView] = [titleLabel]
        if let componenets {
            views.append(contentsOf: componenets)
        }
        views
            .forEach{
                $0.translatesAutoresizingMaskIntoConstraints = false
                stackView.addArrangedSubview($0)
            }
        
        let horizontalInset: CGFloat = 10
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: horizontalInset),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -horizontalInset),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
