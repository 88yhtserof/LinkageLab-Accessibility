//
//  MapInfoViewController+DataSource.swift
//  IssueCard
//
//  Created by 링키지랩 on 10/15/24.
//

import UIKit

extension MapInfoViewController {
    typealias DataSource = UICollectionViewDiffableDataSource<Int, MapInfo>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Int, MapInfo>
    
    func cellRegistrationHandler(cell: MapInfoListCell, indexPath: IndexPath, item: MapInfo) {
        (item.innerView as! any Actionable as Actionable).action = { title, actionTitle in
            let actionSheet = UIAlertController(title: title, message: nil, preferredStyle: .actionSheet)
            let action = UIAlertAction(title: actionTitle, style: .default)
            let cancelAction = UIAlertAction(title: "취소", style: .cancel)
            actionSheet.addAction(action)
            actionSheet.addAction(cancelAction)
            self.present(actionSheet, animated: true)
        }
        
        cell.imageView.image = UIImage(systemName: item.image)
        cell.innerView.addPinnedSubview(item.innerView, height: nil)
        if let view = item.rightView {
            cell.rightView.addPinnedSubview(view, height: nil)
        }
    }
    
    func updateSnapshot() {
        var snapshot = Snapshot()
        snapshot.appendSections([0])
        snapshot.appendItems(mapInfos)
        dataSource.apply(snapshot)
    }
}

