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
    var publicHolidays = PublicHoliday.samples
    
    private lazy var dateBoxView = ComponentBoxView([labelForDatePicker, datePicker])
    private lazy var labelForDatePicker = UILabel()
    private lazy var datePicker = UIDatePicker()
    private lazy var countdownBoxView = ComponentBoxView([labelForCountdown, countdownPicker])
    private lazy var labelForCountdown = UILabel()
    private lazy var countdownPicker = UIDatePicker()
    private lazy var calendarBoxView = ComponentBoxView([calendarView])
    lazy var calendarView = UICalendarView()
    lazy var calendarViewWithAccessibility = UICalendarView()
    
    init() {
        super.init(isAccessible: true)
        
        configureSubViews()
        setPreferredFontyStyle()
        let sections = [
            "DatePicker",
            "Calendar"
        ]
        
        let items = [
            Item(sectionID: 0, tag: .standard, title: "날짜 선택 컴포넌트", description: "버튼을 통해 날짜를 선택할 수 있는 창이 나타나 날짜를 선택할 수 있습니다.", view: dateBoxView),
            Item(sectionID: 0, tag: .standard, title: "시간 선택 컴포넌트",description: "시간과 분을 선택할 수 있습니다.", view: countdownBoxView),
            Item(sectionID: 1, tag: .standard, title: "달력 컴포넌트", description: "달력을 볼 수 있는 컴포넌트입니다.", view: calendarBoxView),
            Item(sectionID: 1, tag: .improve, title: "달력 컴포넌트", description: "달력을 볼 수 있는 컴포넌트로, 공휴일과 오늘을 기호를 통해 확인할 수 있도록 개선했습니다.", view: calendarViewWithAccessibility)
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
            }
        
        datePicker.datePickerMode = .dateAndTime
        datePicker.addTarget(self, action: #selector(didSelectDate), for: .valueChanged)
        
        countdownPicker.datePickerMode = .countDownTimer
        countdownPicker.addTarget(self, action: #selector(didSelectCountdown), for: .valueChanged)
        
        let dateSelection = UICalendarSelectionSingleDate(delegate: self)
        calendarView.selectionBehavior = dateSelection
        
        calendarViewWithAccessibility.selectionBehavior = dateSelection
        calendarViewWithAccessibility.delegate = self
    }
}

extension DateAndTimeViewController: DynamicTypeable {
    func setPreferredFontyStyle() {
        labelForCountdown.font = UIFont.preferredFont(forTextStyle: .body)
        labelForDatePicker.font = UIFont.preferredFont(forTextStyle: .body)
    }
}
