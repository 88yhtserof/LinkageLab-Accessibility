//
//  TableViewController.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 9/23/24.
//

import UIKit

final class TableViewController: DefaultViewController {
    
    var isShownGrabber = false
    
    static let reuseIdentifier = "tableview-identifier"
    var books = Book.samples
    var dataSource: DataSource!
    var snapshot: Snapshot!
    
    private lazy var tableView = UITableView()
    lazy var grabber = GrabberView()
    
    // MARK: Initialize
    init() {
        super.init(nibName: nil, bundle: nil)
        super.isSettingFocus = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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

extension TableViewController {
    func configureView() {
        grabber.isHidden = !isShownGrabber
        view.backgroundColor = .white
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: TableViewController.reuseIdentifier)
        
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
