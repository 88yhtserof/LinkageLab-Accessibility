//
//  MelonChartNavigationViewController+Action.swift
//  DefaultComponents-Accessibility
//
//  Created by 임윤휘 on 10/18/24.
//

import UIKit

extension MelonChartNavigationViewController {
    @objc func didTapPlayButton(_ sender: UIButton) {
        let title = books[sender.tag].title
        let alert = UIAlertController(title: "음악 재생", message: "<\(title)>을 재생하시겠습니까?", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "취소", style: .cancel)
        let okAction = UIAlertAction(title: "확인", style: .default)
        [ cancelAction, okAction ]
            .forEach{ alert.addAction($0) }
        self.present(alert, animated: true)
    }
    
    @objc func didTapMusicGroup() {
        let vc = TableViewController(isAccessible: false)
        navigationController?.pushViewController(vc, animated: true)
    }
}
