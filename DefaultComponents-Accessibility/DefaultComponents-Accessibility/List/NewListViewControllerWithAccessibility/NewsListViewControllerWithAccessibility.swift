//
//  NewsListViewControllerWithAccessibility.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 10/10/24.
//

import UIKit

final class NewsListViewControllerWithAccessibility: DefaultViewController {
    
    var pagable: Pagable<News>!
    var news = Array(News.samples[..<3])
    var dataSource: DataSource!
    var snapshot: Snapshot!
    
    lazy var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSubviews()
        configureConstraints()
    }
}

private extension NewsListViewControllerWithAccessibility {
    func configureSubviews() {
        tableView.register(NewsListCellWithAccessibility.self, forCellReuseIdentifier: NewsListCellWithAccessibility.reuseIdentifier)
        
        dataSource = DataSource(tableView: tableView) { tableView, indexPath, itemIdentifier in
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsListCellWithAccessibility.reuseIdentifier, for: indexPath) as? NewsListCellWithAccessibility else { return UITableViewCell() }
            cell.selectionStyle = .none
            cell.title = self.news[indexPath.row].title
            cell.content = self.news[indexPath.row].content
            return cell
        }
        initializeSnapshot()
        tableView.dataSource = dataSource
        tableView.tableFooterView = ButtonSupplementaryView(title: "더보기")
        
        let footerView = ButtonSupplementaryView(title: "더보기")
        footerView.delegate = self
        tableView.tableFooterView = footerView
    }
    
    func configureConstraints() {
        view.addPinnedSubview(tableView, height: nil)
    }
}
