//
//  DateAndTimeViewController.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 9/11/24.
//

import UIKit

final class DateAndTimeViewController: DefaultCollectionViewController {
    
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
    
    init() {
        super.init(isAccessible: true)
        
        configureSubViews()
        let sections = [
            "UIDatePicker",
            "UICalendar"
        ]
        
        let items = [
            Item(sectionID: 0, tag: .standard, description: "날짜를 선택할 수 있는 컴포넌트", view: dateBoxView),
            Item(sectionID: 0, tag: .standard,description: "시간을 선택할 수 있는 컴포넌트", view: countdownBoxView),
            Item(sectionID: 1, tag: .standard, description: "달력 컴포넌트", view: calendarBoxView)
        ]
        super.sections = sections
        super.items = items
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        
        let dateSelection = UICalendarSelectionSingleDate(delegate: self)
        calendarView.selectionBehavior = dateSelection
        calendarView.delegate = self
        
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 35
    }
}
