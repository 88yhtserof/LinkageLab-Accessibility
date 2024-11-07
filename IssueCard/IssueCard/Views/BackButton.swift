//
//  BackButton.swift
//  IssueCard
//
//  Created by 링키지랩 on 11/7/24.
//

import UIKit

final class BackButton: UIButton {
    
    var controller: UIViewController
    
    init(of controller: UIViewController) {
        self.controller = controller
        
        super.init(frame: .zero)
        var config = UIButton.Configuration.plain()
        config.image = UIImage(systemName: "chevron.backward")
        self.configuration = config
        isUserInteractionEnabled = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        controller.navigationController?.popViewController(animated: true)
    }
}

