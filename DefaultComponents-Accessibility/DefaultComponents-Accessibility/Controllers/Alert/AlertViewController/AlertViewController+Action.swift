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
        let alertVC = UIAlertController(title: "오류", message: "네트워크 오류가 발생했습니다.\n와이파이를 확인해주십시오.", preferredStyle: .alert)
        let action = UIAlertAction(title: "확인", style: .default, handler: didSelectOK(_:))
        alertVC.addAction(action)
        
        self.present(alertVC, animated: true)
    }
    
    @objc func didPresentAlertForSelect(_ sender: UIButton) {
        let alertVC = UIAlertController(title: "알림 활성화", message: "알림을 활성화 하시겠습니까?", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: didSelectCancel(_:))
        let okAction = UIAlertAction(title: "확인", style: .default, handler: didSelectOK(_:))
        
        [ cancelAction, okAction ]
            .forEach{ alertVC.addAction($0) }
        self.present(alertVC, animated: true)
    }
    
    @objc func didPresentAlertForTextField(_ sender: UIButton) {
        let alertVC = UIAlertController(title: "닉네임 설정", message: "원하는 닉네임을 입력하십시오.", preferredStyle: .alert)
        alertVC.addTextField { textField in
            textField.placeholder = "예: 하퍼"
        }
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: didSelectCancel(_:))
        let okAction = UIAlertAction(title: "확인", style: .default, handler: didSelectOK(_:))
        
        [ cancelAction, okAction ]
            .forEach{ alertVC.addAction($0) }
        self.present(alertVC, animated: true)
    }
    
    @objc func didPresentActionSheetForAction(_ sender: UIButton) {
        let actionSheetVC = UIAlertController(title: "동작", message: "다음 동작 중 하나를 선택하십시오.", preferredStyle: .actionSheet)
        
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
