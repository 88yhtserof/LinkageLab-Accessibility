//
//  RecentSearchViewController+Delegate.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 10/23/24.
//

import UIKit

extension RecentSearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        if let searchWord = searchBar.text {
            filteredSnapshot(searchWord: searchWord)
            
            let userInfo = UserInfo(nickname: searchWord)
            guard !recents.contains(userInfo) else { return }
            let item = Item(recent: UserInfo(nickname: searchWord))
            updateSnapshotForRecent(itemToAdd: item)
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        initialSnapshot()
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        emptySnashotForResult()
    }
}
