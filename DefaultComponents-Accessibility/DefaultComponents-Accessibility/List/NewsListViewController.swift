//
//  NewsListViewController.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 10/10/24.
//

import UIKit

final class NewsListViewController: DefaultViewController {
    
    var news: [String] = ["속보입니다1", "속보입니다2", "속보입니다3", "속보입니다4"]
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
            cell.title = self.news[indexPath.row]
            cell.content = """
여러분은 퇴근한 후에 혹은 주말에 운동을 하시나요? 일과 운동을 병행하는건 저에게는 참 어려운일인데요, 링키지랩 크루 중 운동 선수로 활동하고 계시는 크루들이 많으시더라구요!
이번 43회 전국장애인체육대회에 출전하신다는 소식에 링키지랩에서는 대회 이동전후에 편한하게 착용하실 수 있도록 트레이닝복을 제작하여 전달을 드렸어요!
링키지랩 참여 크루의 선전과 활약을 응원합니다!
"""
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
    typealias DataSource = UITableViewDiffableDataSource<Int, String>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Int, String>
    
    func initializeSnapshot() {
        snapshot = Snapshot()
        snapshot.appendSections([0])
        snapshot.appendItems(news)
        dataSource.apply(snapshot)
    }
}
