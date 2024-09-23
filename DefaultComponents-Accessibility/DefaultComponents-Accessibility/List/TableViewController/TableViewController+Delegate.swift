//
//  TableViewController+Delegate.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 9/23/24.
//

import UIKit

extension TableViewController {
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let contextualAction = UIContextualAction(style: .destructive, title: "Delete") { _, _, handler in
            self.outlines.remove(at: indexPath.item)
            self.updateSnapshot()
            handler(true)
        }
        return UISwipeActionsConfiguration(actions: [contextualAction])
    }
}
