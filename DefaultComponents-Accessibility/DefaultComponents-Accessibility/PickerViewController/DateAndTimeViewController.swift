//
//  DateAndTimeViewController.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 9/11/24.
//

import UIKit

final class DateAndTimeViewController: UIViewController {
    
    var navigationTitle: String? {
        didSet {
            navigationItem.title = navigationTitle
        }
    }
    
    var textForDataPicker: String? {
        didSet {
            if labelForDatePicker.alpha < 1.0 {
                labelForDatePicker.alpha = 1.0
            }
            labelForDatePicker.text = textForDataPicker
        }
    }
    
    private lazy var dateBoxView = ComponentBoxView([labelForDatePicker, datePicker])
    private lazy var labelForDatePicker = UILabel()
    private lazy var datePicker = UIDatePicker()
    private lazy var stackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSubViews()
        configureView()
        configureConstraints()
    }
}

// MARK: Configuration
private extension DateAndTimeViewController {
    func configureSubViews() {
        let labelTexts = [
            "DatePicker의 결과를 보여줍니다"
        ]
        
        [ labelForDatePicker ]
            .enumerated()
            .forEach { (offset, view) in
                view.text = labelTexts[offset]
                view.alpha = CGFloat(0.5)
                view.font = .systemFont(ofSize: 20, weight: .medium)
            }
        
        datePicker.datePickerMode = .dateAndTime
        datePicker.addTarget(self, action: #selector(didSelectDate), for: .valueChanged)
        
        dateBoxView.title = "날짜 선택 컴포넌트"
    }
    
    func configureView() {
        view.backgroundColor = .systemBackground
    }
    
    func configureConstraints() {
        [ dateBoxView ]
            .forEach{
                stackView.addArrangedSubview($0)
            }
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        let verticalInset: CGFloat = 50
        let horizontalInset: CGFloat = 10
        let padding: CGFloat = 8
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: verticalInset),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: horizontalInset),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -horizontalInset)
        ])
    }
}
