//
//  SearchViewControllerWithAccessibility+Updating.swift
//  DefaultComponents-Accessibility
//
//  Created by 임윤휘 on 10/6/24.
//

import UIKit

extension SearchViewControllerWithAccessibility: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
        if let searchWord = searchController.searchBar.text, !searchWord.isEmpty {
            filteredSnapshot(searchWord: searchWord)
        }
    }
}
