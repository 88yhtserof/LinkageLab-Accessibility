//
//  TableViewController.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 9/23/24.
//

import UIKit

final class TableViewController: UITableViewController, Titleable {
    
    var navigationTitle: String? {
        didSet {
            navigationItem.title = navigationTitle
        }
    }
    var contentDescription: String?
    
    static let reuseIdentifier = "tableview-identifier"
    var books = Book.samples
    var dataSource: DataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if  UIAccessibility.isVoiceOverRunning,
            let sheet = self.sheetPresentationController
        {
            print(sheet.selectedDetentIdentifier)
            view.isAccessibilityElement = true
            view.accessibilityLabel = "책 목록을 탐색할 수 있는 화면입니다"
            view.accessibilityValue = "시트의 크기가 화면의 절반 정도 차지하고 있습니다"
            UIAccessibility.post(notification: .screenChanged, argument: view)
        }
    }
}

extension TableViewController {
    func configureView() {
        view.backgroundColor = .white
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: TableViewController.reuseIdentifier)
        
        dataSource = DataSource(tableView: tableView, cellProvider: { tableView, indexPath, itemIdentifier in
            let cell = tableView.dequeueReusableCell(withIdentifier: TableViewController.reuseIdentifier, for: indexPath)
            var config = cell.defaultContentConfiguration()
            config.text = itemIdentifier
            cell.contentConfiguration = config
            return cell
        })
        
        updateSnapshot()
        tableView.dataSource = dataSource
    }
}
