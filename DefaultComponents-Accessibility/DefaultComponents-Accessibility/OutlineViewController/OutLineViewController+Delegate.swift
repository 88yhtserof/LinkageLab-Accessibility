//
//  OutLineViewController+Delegate.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 9/11/24.
//

import UIKit

extension OutlineViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let itemCase = Outline.OutLineCase(rawValue: indexPath.row)
        var vc: UIViewController
        
        switch itemCase {
        case .button:
            vc = ButtonAndSliderViewController()
        case .text:
            vc = TextInputViewController()
        case .activityIndicatorWithSwitch:
            vc = StateViewController()
        case .picker:
            vc = DateAndTimeViewController()
        case .none:
            fatalError("Missing OutLine Case")
        }
        
        navigationController?.pushViewController(vc, animated: true)
    }
}
