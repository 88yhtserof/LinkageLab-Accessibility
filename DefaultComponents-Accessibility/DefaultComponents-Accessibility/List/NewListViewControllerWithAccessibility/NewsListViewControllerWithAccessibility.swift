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
    
    private lazy var tableView = UITableView()
    
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

extension NewsListViewControllerWithAccessibility: ButtonSupplementaryViewDelegate {
    func buttonSupplementaryView(didTapButton button: UIButton) {
        if pagable.total == News.samples.count {
            let alert = UIAlertController(title: "마지막 페이지입니다", message: "모든 페이지를 확인하셨습니다.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .default))
            self.present(alert, animated: true)
            return
        }
        
        let startIndex = pagable.lastIndex + 1
        let expectedEndIndex = pagable.lastIndex + pagable.display
        
        let endIndex = expectedEndIndex < News.samples.count ? expectedEndIndex : pagable.lastIndex + (News.samples.count - pagable.lastIndex - 1)
        
        let items = Array(News.samples[startIndex...endIndex])
        updateSnapshot(newItems: items, after: pagable.lastIndex)
        
        if UIAccessibility.isVoiceOverRunning {
            Task {
                try? await announceNumOfAddedNews(count: endIndex - startIndex + 1)
            }
        }
    }
    
    @MainActor
    func announceNumOfAddedNews(count: Int) async throws {
        try await Task.sleep(for: .seconds(0.8))
        UIAccessibility.post(notification: .announcement, argument: "\(count)개의 뉴스가 추가되었습니다")
    }
}

extension NewsListViewControllerWithAccessibility {
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
