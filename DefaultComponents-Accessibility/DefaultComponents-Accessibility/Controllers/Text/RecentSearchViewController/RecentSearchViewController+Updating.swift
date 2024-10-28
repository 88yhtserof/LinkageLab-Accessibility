//
//  RecentSearchViewController+Updating.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 10/23/24.
//

import UIKit

extension RecentSearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
        if let searchWord = searchController.searchBar.text, !searchWord.isEmpty {
            filteredSnapshot(searchWord: searchWord)
        }
    }
}
