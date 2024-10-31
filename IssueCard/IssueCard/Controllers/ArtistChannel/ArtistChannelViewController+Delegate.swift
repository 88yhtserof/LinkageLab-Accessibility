//
//  ArtistChannelViewController+Delegate.swift
//  IssueCard
//
//  Created by 링키지랩 on 10/30/24.
//

import UIKit

extension ArtistChannelViewController: AdjustableForAccessibility {
    func adjustableIncrement(_ view: AnyObject) {
        if let cell = view as? LatestCollectionListCell {
            guard cell.currentPage < (books.count - 1) else { return }
            cell.currentPage += 1
            configureAccessibilityValue(cell, current: cell.currentPage, for: .latest)
            
            if cell.currentPage != 0, cell.currentPage % 4 == 0 {
                cell.collectionView.scrollToItem(at: IndexPath(item: cell.currentPage, section: 0), at: .left, animated: true)
            }
        } else if let cell = view as? ChartCollectionListCell {
            guard cell.currentPage < (books.count - 1) else { return }
            cell.currentPage += 1
            configureAccessibilityValue(cell, current: cell.currentPage, for: .chart)
            
            if cell.currentPage != 0, cell.currentPage % 3 == 0 {
                cell.collectionView.scrollToItem(at: IndexPath(item: cell.currentPage, section: 0), at: .left, animated: true)
            }
        } else if let cell = view as? TodayCollectionListCell {
            guard cell.currentPage < (cell.books.count - 1) else { return }
            cell.currentPage += 1
            configureAccessibilityValue(cell, current: cell.currentPage, for: .today)
            
            if cell.currentPage != 0, cell.currentPage % 2 == 0 {
                cell.collectionView.scrollToItem(at: IndexPath(item: cell.currentPage, section: 0), at: .left, animated: true)
            }
        }
    }
    
    func adjustableDecrement(_ view: AnyObject) {
        if let cell = view as? LatestCollectionListCell {
            guard cell.currentPage > 0 else { return }
            cell.currentPage -= 1
            configureAccessibilityValue(cell, current: cell.currentPage, for: .latest)
            
            if cell.currentPage % 4 == 3 {
                cell.collectionView.scrollToItem(at: IndexPath(item: cell.currentPage, section: 0), at: .right, animated: true)
            }
        } else if let cell = view as? ChartCollectionListCell {
            guard cell.currentPage > 0 else { return }
            cell.currentPage -= 1
            configureAccessibilityValue(cell, current: cell.currentPage, for: .chart)
            
            if cell.currentPage % 3 == 2 {
                cell.collectionView.scrollToItem(at: IndexPath(item: cell.currentPage, section: 0), at: .right, animated: true)
            }
        } else if let cell = view as? TodayCollectionListCell {
            guard cell.currentPage > 0 else { return }
            cell.currentPage -= 1
            configureAccessibilityValue(cell, current: cell.currentPage, for: .today)
            
            if cell.currentPage % 2 == 1 {
                cell.collectionView.scrollToItem(at: IndexPath(item: cell.currentPage, section: 0), at: .right, animated: true)
            }
        }
    }
}
