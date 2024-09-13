//
//  AlertViewController+Action.swift
//  DefaultComponents-Accessibility
//
//  Created by 링키지랩 on 9/13/24.
//

import UIKit

extension AlertViewController {
    
    // MARK: Button Action
    @objc func didPresentAlertForMessage(_ sender: UIButton){
        let alertVC = UIAlertController(title: "Aler: 안내", message: "사용자에게 전달하고 싶은 메세지입니다", preferredStyle: .alert)
        let action = UIAlertAction(title: "확인", style: .default, handler: didSelectOK(_:))
        alertVC.addAction(action)
        
        self.present(alertVC, animated: true)
    }
    
    @objc func didPresentAlertForSelect(_ sender: UIButton) {
        let alertVC = UIAlertController(title: "Alert: 선택", message: "알림을 활성화 하시겠습니까?", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: didSelectCancel(_:))
        let okAction = UIAlertAction(title: "확인", style: .default, handler: didSelectOK(_:))
        
        [ cancelAction, okAction ]
            .forEach{ alertVC.addAction($0) }
        self.present(alertVC, animated: true)
    }
    
    @objc func didPresentAlertForTextField(_ sender: UIButton) {
        let alertVC = UIAlertController(title: "Alert: 입력", message: "닉네임을 변경하시겠습니까?", preferredStyle: .alert)
        alertVC.addTextField { textField in
            textField.placeholder = "원하는 닉네임을 입력하세요"
        }
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: didSelectCancel(_:))
        let okAction = UIAlertAction(title: "확인", style: .default, handler: didSelectOK(_:))
        
        [ cancelAction, okAction ]
            .forEach{ alertVC.addAction($0) }
        self.present(alertVC, animated: true)
    }
    
    @objc func didPresentActionSheetForAction(_ sender: UIButton) {
        let actionSheetVC = UIAlertController(title: "ActionSheet: 동작", message: "다른 형태의 Alert입니다. \n 여러 동작을 추가할 수 있습니다", preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: didSelectCancel)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: didSelectOK)
        let destructiveAction = UIAlertAction(title: "삭제", style: .destructive, handler: didSelectDestructive)
        
        [ cancelAction, okAction, destructiveAction ]
            .forEach{ actionSheetVC.addAction($0) }
        self.present(actionSheetVC, animated: true)
    }
    
    // MARK: Alert Action
    private func didSelectOK(_ action: UIAlertAction) {
        print("didSelectOK")
    }
    
    private func didSelectCancel(_ action: UIAlertAction) {
        print("didSelectCancel")
    }
    
    private func didSelectDestructive(_ action: UIAlertAction) {
        print("didSelectDestructive")
    }
}
