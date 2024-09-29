//
//  PresentationAndMenuViewController+Delegate.swift
//  DefaultComponents-Accessibility
//
//  Created by 임윤휘 on 9/29/24.
//

import UIKit

extension PresentationAndMenuViewController: UISheetPresentationControllerDelegate {
    func sheetPresentationControllerDidChangeSelectedDetentIdentifier(_ sheetPresentationController: UISheetPresentationController) {
        
        guard UIAccessibility.isVoiceOverRunning,
              let selectedDetent = sheetPresentationController.selectedDetentIdentifier,
              isAccessible else { return }
        
        if selectedDetent == UISheetPresentationController.Detent.medium().identifier {
            UIAccessibility.post(notification: .screenChanged, argument: "시트의 크기가 화면의 절반 정도 차지하고 있습니다")
        } else {
            UIAccessibility.post(notification: .screenChanged, argument: "시트의 크기가 화면 가득 확장되어 있습니다")
        }
    }
}
