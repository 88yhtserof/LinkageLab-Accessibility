//
//  PresentationAndMenuViewController+Action.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 9/23/24.
//

import UIKit

extension PresentationAndMenuViewController {
    @objc func didTapPresentButton(_ sender: UIButton) {
        let presentVC = TableViewController()
        if let sheet = presentVC.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
            sheet.prefersGrabberVisible = true
        }
        present(presentVC, animated: true)
    }
    
    func changeBackgroundAction() -> UIAction {
        return UIAction(title: "배경 변경", image: UIImage(systemName: "lasso")) { _ in
            if let color = self.view.backgroundColor, color == UIColor.white {
                self.view.backgroundColor = .lightGray
            } else {
                self.view.backgroundColor = .white
            }
        }
    }
    
    func moreMenu() -> UIMenu {
        return UIMenu(title: "더보기", subtitle: "상세 메뉴를 볼 수 있습니다", children: [changeBackgroundAction()])
    }
}
