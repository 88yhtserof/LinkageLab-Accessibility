//
//  SearchViewController+Updating.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 10/4/24.
//

import UIKit

extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
        if let searchWord = searchController.searchBar.text, !searchWord.isEmpty {
            filteredSnapshot(searchWord: searchWord)
        }
    }
}
