//
//  NewsListViewController.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 10/10/24.
//

import UIKit

final class NewsListViewController: DefaultViewController {
    
    var pagable: Pagable<News>!
    var news = Array(News.samples[..<3])
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
        tableView.tableFooterView = ButtonSupplementaryView(title: "더보기")
        
        let footerView = ButtonSupplementaryView(title: "더보기")
        footerView.delegate = self
        tableView.tableFooterView = footerView
    }
    
    func configureConstraints() {
        view.addPinnedSubview(tableView, height: nil)
        
    }
}

extension NewsListViewController: ButtonSupplementaryViewDelegate {
    func buttonSupplementaryView(didTapButton button: UIButton) {
        if pagable.total == News.samples.count {
            var alert = UIAlertController(title: "마지막 페이지입니다", message: "모든 페이지를 확인하셨습니다.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .default))
            self.present(alert, animated: true)
            return
        }
        
        let startIndex = pagable.lastIndex + 1
        let expectedEndIndex = pagable.lastIndex + pagable.display
        
        let endIndex = expectedEndIndex < News.samples.count ? expectedEndIndex : pagable.lastIndex + (News.samples.count - pagable.lastIndex - 1)
        
        let items = Array(News.samples[startIndex...endIndex])
        
        updateSnapshot(newItems: items, after: pagable.lastIndex)
    }
}

extension NewsListViewController {
    typealias DataSource = UITableViewDiffableDataSource<Int, News>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Int, News>
    
    func initializeSnapshot() {
        pagable = Pagable(total: news.count, start: 0, display: 3, lastIndex: news.count - 1)
        snapshot = Snapshot()
        snapshot.appendSections([0])
        snapshot.appendItems(news)
        dataSource.apply(snapshot)
    }
    
    func updateSnapshot(newItems items: [News], after index: Int) {
        pagable.total = pagable.total + items.count
        pagable.start = news.count
        pagable.lastIndex = pagable.total - 1
        snapshot.insertItems(items, afterItem: news[index])
        news.append(contentsOf: items)
        
        dataSource.apply(snapshot)
    }
}
