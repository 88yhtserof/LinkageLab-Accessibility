//
//  DateAndTimeViewController.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 9/11/24.
//

import UIKit

final class DateAndTimeViewController: UIViewController {
    
    var textForPicker: String? {
        didSet {
            if labelForPicker.alpha < 1.0 {
                labelForPicker.alpha = 1.0
            }
            labelForPicker.text = textForPicker
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
    
    var textForColorWell: String? {
        didSet {
            if labelForColorWell.alpha < 1.0 {
                labelForColorWell.alpha = 1.0
            }
            labelForColorWell.text = textForColorWell
        }
    }
    
    private lazy var labelForPicker = UILabel()
    private lazy var pickerView = UIPickerView()
    private lazy var labelForDatePicker = UILabel()
    private lazy var datePicker = UIDatePicker()
    private lazy var labelForColorWell = UILabel()
    private lazy var colorWell = UIColorWell()
    
    var cities = [
        "서울",
        "런던",
        "도쿄",
        "뉴욕"
    ]
    
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
            "Picker의 결과를 보여줍니다",
            "DatePicker의 결과를 보여줍니다",
            "ColorWell의 결과를 보여줍니다"
        ]
        
        [ labelForPicker, labelForDatePicker, labelForColorWell ]
            .enumerated()
            .forEach { (offset, view) in
                view.text = labelTexts[offset]
                view.alpha = CGFloat(0.5)
                view.font = .systemFont(ofSize: 20, weight: .medium)
            }
        
        pickerView.dataSource = self
        pickerView.delegate = self
        
        datePicker.datePickerMode = .dateAndTime
        datePicker.addTarget(self, action: #selector(didSelectDate), for: .valueChanged)
        
        colorWell.addTarget(self, action: #selector(didSelectColor), for: .valueChanged)
    }
    
    func configureView() {
        view.backgroundColor = .systemBackground
    }
    
    func configureConstraints() {
        [ labelForPicker, datePicker, pickerView, labelForDatePicker, labelForColorWell, colorWell ]
            .forEach{
                $0.translatesAutoresizingMaskIntoConstraints = false
                view.addSubview($0)
            }
        
        let verticalInset: CGFloat = 50
        let horizontalInset: CGFloat = 10
        let padding: CGFloat = 8
        
        NSLayoutConstraint.activate([
            labelForPicker.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: verticalInset),
            labelForPicker.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: horizontalInset),
            
            pickerView.topAnchor.constraint(equalTo: labelForPicker.bottomAnchor, constant: padding),
            pickerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: horizontalInset),
            pickerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -horizontalInset),
            
            labelForDatePicker.topAnchor.constraint(equalTo: pickerView.bottomAnchor, constant: verticalInset),
            labelForDatePicker.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: horizontalInset),
            labelForDatePicker.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -horizontalInset),
            
            datePicker.topAnchor.constraint(equalTo: labelForDatePicker.bottomAnchor, constant: padding),
            datePicker.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: horizontalInset),
            
            labelForColorWell.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: verticalInset),
            labelForColorWell.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: horizontalInset),
            labelForColorWell.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -horizontalInset),
            
            colorWell.topAnchor.constraint(equalTo: labelForColorWell.bottomAnchor, constant: padding),
            colorWell.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: horizontalInset)
        ])
    }
}
