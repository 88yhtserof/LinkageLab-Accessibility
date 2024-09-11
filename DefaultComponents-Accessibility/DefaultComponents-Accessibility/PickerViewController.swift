//
//  PickerViewController.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 9/11/24.
//

import UIKit

final class PickerViewController: UIViewController {
    
    lazy var labelForPicker = UILabel()
    lazy var pickerView = UIPickerView()
    lazy var labelForDatePicker = UILabel()
    lazy var datePicker = UIDatePicker()
    lazy var labelForColorWell = UILabel()
    lazy var colorWell = UIColorWell()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSubViews()
        configureView()
        configureConstraints()
    }
}

// MARK: Configuration
private extension PickerViewController {
    func configureSubViews() {
        
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
        
        let verticalInset: CGFloat = 30
        let horizontalInset: CGFloat = 10
        let padding: CGFloat = 3
        
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
            datePicker.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -horizontalInset),
            
            labelForColorWell.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: verticalInset),
            labelForColorWell.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: horizontalInset),
            labelForColorWell.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -horizontalInset),
            
            colorWell.topAnchor.constraint(equalTo: labelForColorWell.bottomAnchor, constant: padding),
            colorWell.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: horizontalInset),
            colorWell.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -horizontalInset),
//            colorWell.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -verticalInset),
        ])
    }
}

