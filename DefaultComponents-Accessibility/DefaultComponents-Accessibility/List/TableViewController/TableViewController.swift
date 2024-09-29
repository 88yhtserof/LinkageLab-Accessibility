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
    var snapshot: Snapshot!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if  UIAccessibility.isVoiceOverRunning && presentingViewController != nil {
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
        
        dataSource = DataSource(tableView: tableView, cellProvider: { tableView, indexPath, _ in
            let item = self.books[indexPath.item]
            let cell = tableView.dequeueReusableCell(withIdentifier: TableViewController.reuseIdentifier, for: indexPath)
            var config = cell.defaultContentConfiguration()
            config.text = item.title
            if item.bookmark {
                let image = UIImage(systemName: "star.fill")
                config.image = image
                cell.accessibilityValue = "즐겨찾기"
            }
            cell.contentConfiguration = config
            cell.accessibilityHint = "동작을 사용하려면 한 손가락으로 쓸어내리거나 쓸어올리십시오"
            return cell
        })
        
        createSnapshot()
        tableView.dataSource = dataSource
    }
}
