//
//  TableViewController+Delegate.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 9/23/24.
//

import UIKit

extension TableViewController {
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "삭제하기") { _, _, handler in
            let item = self.books[indexPath.item]
            self.deleteSnapshot(at: item)
            self.books.remove(at: indexPath.item)
            handler(true)
        }
        let bookmarkAction = UIContextualAction(style: .normal, title: "즐겨찾기") { action, view, handler in
            self.books[indexPath.item].bookmark.toggle()
            let item = self.books[indexPath.item]
            self.reconfigureSnapshot(at: item)
            handler(true)
            if self.isAccessible {
                let announcement = self.books[indexPath.item].bookmark ? "즐겨찾기 설정" : "즐겨찾기 해제"
                UIAccessibility.post(notification: .announcement, argument: announcement)
            }
        }
        
        return UISwipeActionsConfiguration(actions: [deleteAction, bookmarkAction])
    }
}
