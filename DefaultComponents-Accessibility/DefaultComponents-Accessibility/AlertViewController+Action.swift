//
//  AlertViewController+Action.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 9/13/24.
//

import UIKit

extension AlertViewController {
    
    @objc func didPresentAlertForMessage(_ sender: UIButton){
        let alertVC = UIAlertController(title: "AlertForMessage", message: "사용자에게 전달하고 싶은 메세지입니다", preferredStyle: .alert)
        let action = UIAlertAction(title: "확인", style: .default, handler: didSelectOK(_:))
        alertVC.addAction(action)
        
        self.present(alertVC, animated: true)
    }
    
    @objc func didPresentAlertForSelect(_ sender: UIButton) {
        let alertVC = UIAlertController(title: "AlertForSelect", message: "알림을 활성화 하시겠습니까?", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: didSelectCancel(_:))
        let okAction = UIAlertAction(title: "확인", style: .default, handler: didSelectOK(_:))
        
        [ cancelAction, okAction ]
            .forEach{ alertVC.addAction($0) }
        self.present(alertVC, animated: true)
    }
    
    private func didSelectOK(_ action: UIAlertAction) {
        print("didSelectOK")
    }
    
    private func didSelectCancel(_ action: UIAlertAction) {
        print("didSelectCancel")
    }
}
