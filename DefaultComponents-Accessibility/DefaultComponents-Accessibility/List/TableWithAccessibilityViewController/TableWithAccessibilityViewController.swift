//
//  TableWithAccessibilityViewController.swift
//  DefaultComponents-Accessibility
//
//  Created by 임윤휘 on 10/20/24.
//

import UIKit

final class TableWithAccessibilityViewController: DefaultViewController {
    
    var isShownGrabber = false
    
    static let reuseIdentifier = "tableview-identifier"
    var books = Book.samples
    var dataSource: DataSource!
    var snapshot: Snapshot!
    
    private lazy var tableView = UITableView()
    lazy var grabber = GrabberView()
    
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        if isShownGrabber {
            configureConstrationsWithGrabber()
        } else {
            configureConstrations()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if  UIAccessibility.isVoiceOverRunning && presentingViewController != nil {
            grabber.isAccessibilityElement = true
            grabber.accessibilityLabel = "책 목록을 탐색할 수 있는 화면입니다"
            grabber.accessibilityValue = "절반 화면"
            grabber.actionAccessibility = didDoubleTap
        }
    }
    
    @objc func didDoubleTap() {
        if let sheet = self.sheetPresentationController {
            if grabber.accessibilityLabel != nil {
                grabber.accessibilityLabel = nil
            }
            if let identifier = sheet.selectedDetentIdentifier, identifier == .large {
                sheet.animateChanges {
                    sheet.selectedDetentIdentifier = .medium
                }
                grabber.accessibilityValue = "절반 화면"
            } else {
                sheet.animateChanges {
                    sheet.selectedDetentIdentifier = .large
                }
                grabber.accessibilityValue = "전체 화면"
            }
        }
    }
}

extension TableWithAccessibilityViewController {
    func configureView() {
        grabber.isHidden = !isShownGrabber
        view.backgroundColor = .white
        tableView.delegate = self
        tableView.register(ButtonTraitsTableCell.self, forCellReuseIdentifier: TableViewController.reuseIdentifier)
        
        dataSource = DataSource(tableView: tableView, cellProvider: { tableView, indexPath, _ in
            let item = self.books[indexPath.item]
            let cell = tableView.dequeueReusableCell(withIdentifier: TableViewController.reuseIdentifier, for: indexPath)
            var config = cell.defaultContentConfiguration()
            config.text = item.title
            if item.bookmark {
                let image = UIImage(systemName: "star.fill")
                config.image = image
            }
            cell.contentConfiguration = config
            cell.selectionStyle = .none
            if UIAccessibility.isVoiceOverRunning {
                cell.accessibilityHint = "동작을 사용하려면 한 손가락으로 쓸어내리거나 쓸어올리십시오"
                cell.accessibilityValue = item.bookmark ? "즐겨찾기 설정됨" : "즐겨찾기 해제됨"
            }
            return cell
        })
        
        createSnapshot()
        tableView.dataSource = dataSource
    }
    
    func configureConstrations() {
        view.addSubviews([tableView])
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func configureConstrationsWithGrabber() {
        view.addSubviews([grabber, tableView])
        
        NSLayoutConstraint.activate([
            grabber.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            grabber.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            tableView.topAnchor.constraint(equalTo: grabber.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
