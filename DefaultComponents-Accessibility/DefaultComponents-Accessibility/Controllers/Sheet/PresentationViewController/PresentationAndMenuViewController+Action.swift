//
//  PresentationAndMenuViewController+Action.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 9/23/24.
//

import UIKit

extension PresentationAndMenuViewController {
    @objc func didTapPresentButton(_ sender: UIButton) {
        isPresentAccessible = sender == presentButtonWithAccessibility
        
        let presentVC = TableViewController()
        if let sheet = presentVC.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
            
            if !isPresentAccessible {
                sheet.prefersGrabberVisible = true
            }
        }
        if isPresentAccessible {
            presentVC.isShownGrabber = true
        }
        present(presentVC, animated: true)
    }
    
    func changeBackgroundAction(_ sender: UIButton) -> UIAction {
        return UIAction(title: "배경 변경", image: UIImage(systemName: "lasso")) { action in
            if let color = self.view.backgroundColor, color == UIColor.white {
                self.view.backgroundColor = .lightGray
            } else {
                self.view.backgroundColor = .white
            }
            
            if UIAccessibility.isVoiceOverRunning && sender == self.menuButtonWithAccessibility {
                let colorName = self.view.backgroundColor! == UIColor.white ? "흰색" : "회색"
                let announcement = "배경 색상이 \(colorName)으로 변경되었습니다"
                UIAccessibility.post(notification: .announcement, argument: announcement)
            }
        }
    }
    
    func moreMenu(_ sender: UIButton) -> UIMenu {
        return UIMenu(title: "더보기", subtitle: "상세 메뉴를 볼 수 있습니다", children: [changeBackgroundAction(sender)])
    }
}
