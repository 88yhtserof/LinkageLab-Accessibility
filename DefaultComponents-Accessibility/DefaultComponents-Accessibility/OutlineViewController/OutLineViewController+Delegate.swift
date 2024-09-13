//
//  OutLineViewController+Delegate.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 9/11/24.
//

import UIKit

extension OutLineViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let itemCase = OutLine.OutLineCase(rawValue: indexPath.row)
        var vc: UIViewController
        
        switch itemCase {
        case .button:
            vc = ButtonViewController()
        case .text:
            vc = TextViewController()
        case .activityIndicatorWithSwitch:
            vc = ActivityIndicatorWithSwitchViewController()
        case .picker:
            vc = PickerViewController()
        case .none:
            fatalError("Missing OutLine Case")
        }
        
        navigationController?.pushViewController(vc, animated: true)
    }
}
