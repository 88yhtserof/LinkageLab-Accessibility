//
//  SearchViewControllerWithAccessibility+Delegate.swift
//  DefaultComponents-Accessibility
//
//  Created by 임윤휘 on 10/6/24.
//

import UIKit

extension SearchViewControllerWithAccessibility: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        if let searchWord = searchBar.text {
            filteredSnapshot(searchWord: searchWord)
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        initialSnapshot()
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        emptySnashot()
    }
}
