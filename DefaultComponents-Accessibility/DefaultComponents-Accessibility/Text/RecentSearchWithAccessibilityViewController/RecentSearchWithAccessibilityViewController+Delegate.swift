//
//  RecentSearchWithAccessibilityViewController+Delegate.swift
//  DefaultComponents-Accessibility
//
//  Created by 임윤휘 on 10/25/24.
//

import UIKit

extension RecentSearchWithAccessibilityViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        if let searchWord = searchBar.text {
            filteredSnapshot(searchWord: searchWord)
            
            let userInfo = UserInfo(nickname: searchWord)
            guard !recents.contains(userInfo) else { return }
            let item = Item(recent: UserInfo(nickname: searchWord))
            updateSnapshotForRecent(itemToAdd: item)
            
            if UIAccessibility.isVoiceOverRunning,
               let resultHeader = collectionView.supplementaryView(forElementKind: headerSupplementaryKind, at: IndexPath(item: 0, section: 1)) {
                Task {
                    try? await UIAccessibility.setFocus(to: resultHeader)
                }
            }
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        initialSnapshot()
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        emptySnashotForResult()
    }
}
