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
    
    func didSelectOK(_ action: UIAlertAction) {
        print("didSelectOK")
    }
}
