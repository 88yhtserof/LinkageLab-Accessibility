//
//  DateAndTimeViewController.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 9/11/24.
//

import UIKit

final class DateAndTimeViewController: DefaultViewController {
    
    var textForDataPicker: String? {
        didSet {
            if labelForDatePicker.alpha < 1.0 {
                labelForDatePicker.alpha = 1.0
            }
            labelForDatePicker.text = textForDataPicker
        }
    }
    
    var textForCountdown: String? {
        didSet {
            if labelForCountdown.alpha < 1.0 {
                labelForCountdown.alpha = 1.0
            }
            labelForCountdown.text = textForCountdown
        }
    }
    
    var selectedData: DateComponents? = nil
    var dates: Set<DateComponents> = []
    
    private lazy var dateBoxView = ComponentBoxView([labelForDatePicker, datePicker])
    private lazy var labelForDatePicker = UILabel()
    private lazy var datePicker = UIDatePicker()
    private lazy var countdownBoxView = ComponentBoxView([labelForCountdown, countdownPicker])
    private lazy var labelForCountdown = UILabel()
    private lazy var countdownPicker = UIDatePicker()
    private lazy var calendarBoxView = ComponentBoxView([calendarView])
    lazy var calendarView = UICalendarView()
    private lazy var stackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSubViews()
        configureConstraints()
    }
}

// MARK: Configuration
private extension DateAndTimeViewController {
    func configureSubViews() {
        let labelTexts = [
            "DatePicker의 결과를 보여줍니다",
            "00:00"
        ]
        
        [ labelForDatePicker, labelForCountdown ]
            .enumerated()
            .forEach { (offset, view) in
                view.text = labelTexts[offset]
                view.alpha = CGFloat(0.5)
                view.font = .systemFont(ofSize: 20, weight: .medium)
            }
        
        datePicker.datePickerMode = .dateAndTime
        datePicker.addTarget(self, action: #selector(didSelectDate), for: .valueChanged)
        
        countdownPicker.datePickerMode = .countDownTimer
        countdownPicker.addTarget(self, action: #selector(didSelectCountdown), for: .valueChanged)
        
        dateBoxView.title = "날짜 선택 컴포넌트"
        countdownBoxView.title = "시간 선택 컴포넌트"
        calendarBoxView.title = "달력 컴포넌트"
        
        let dateSelection = UICalendarSelectionSingleDate(delegate: self)
        calendarView.selectionBehavior = dateSelection
        calendarView.delegate = self
        
        stackView.axis = .vertical
        stackView.spacing = 35
    }
    
    func configureConstraints() {
        [ dateBoxView, countdownBoxView, calendarBoxView]
            .forEach{
                stackView.addArrangedSubview($0)
            }
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        let verticalInset: CGFloat = 50
        let horizontalInset: CGFloat = 10
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: horizontalInset),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -horizontalInset),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
