//
//  OutLineViewController+Delegate.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 9/11/24.
//

import UIKit

extension OutlineViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.item <= 0 {
            return
        }
        let sectionCase = Detail.SectionCase(rawValue: indexPath.section)
        let item = indexPath.item - 1
        var vc: Titleable
        
        switch sectionCase {
        case .text:
            switch item {
            case 0:
                vc = TextViewController()
            case 1:
                vc = SearchViewController()
            default:
                return
            }
        case .control:
            switch item {
            case 0:
                vc = ButtonAndSliderViewController()
            case 1:
                vc = SwitchViewController()
            default:
                return
            }
        case .state:
            vc = StateViewController()
        case .dateAndTime:
            vc = DateAndTimeViewController()
        case .list:
            switch item {
            case 0:
                vc = CollectionViewController()
            case 1:
                vc = TableViewController()
            default:
                return
            }
        case .page:
            vc = PageViewController()
        case .alert:
            vc = AlertViewController()
        case .sheet:
            vc = PresentationAndMenuViewController()
        case nil:
            return
        }
        
        vc.navigationTitle = Detail.items[indexPath.section][item].title
        navigationController?.pushViewController(vc as! UIViewController, animated: true)
    }
}