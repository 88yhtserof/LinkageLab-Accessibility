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
        
        if let sheet = self.sheetPresentationController, UIAccessibility.isVoiceOverRunning {
            print("!!!")
            contentDescription = "책 목록을 탐색할 수 있는 화면입니다 \(sheet.detents)"
            UIAccessibility.post(notification: .announcement, argument: contentDescription)
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
