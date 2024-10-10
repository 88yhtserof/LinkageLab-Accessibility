//
//  NewsListViewController.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 10/10/24.
//

import UIKit

final class NewsListViewController: DefaultViewController {
    
    var news = News.samples
    var dataSource: DataSource!
    var snapshot: Snapshot!
    
    private lazy var tableView = UITableView()
    
    init() {
        super.init(nibName: .none, bundle: .none)
        configureSubviews()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension NewsListViewController {
    func configureSubviews() {
        tableView.register(NewsListCell.self, forCellReuseIdentifier: NewsListCell.reuseIdentifier)
        
        dataSource = DataSource(tableView: tableView) { tableView, indexPath, itemIdentifier in
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsListCell.reuseIdentifier, for: indexPath) as? NewsListCell else { return UITableViewCell() }
            cell.selectionStyle = .none
            cell.title = self.news[indexPath.row].title
            cell.content = self.news[indexPath.row].content
            return cell
        }
        initializeSnapshot()
        tableView.dataSource = dataSource
    }
    
    func configureConstraints() {
        view.addPinnedSubview(tableView, height: nil)
    }
}

extension NewsListViewController {
    typealias DataSource = UITableViewDiffableDataSource<Int, News>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Int, News>
    
    func initializeSnapshot() {
        snapshot = Snapshot()
        snapshot.appendSections([0])
        snapshot.appendItems(news)
        dataSource.apply(snapshot)
    }
}
