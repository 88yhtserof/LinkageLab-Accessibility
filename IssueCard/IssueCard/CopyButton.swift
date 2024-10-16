//
//  CopyButton.swift
//  IssueCard
//
//  Created by 링키지랩 on 10/16/24.
//

import UIKit

final class CopyButton: UIButton {
    
    var copyContent: String
    
    init(for content: String) {
        self.copyContent = content
        super.init(frame: .zero)
        var config = UIButton.Configuration.plain()
        config.title = "복사"
        configuration = config
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        copyAction()
    }
    
    override func accessibilityActivate() -> Bool {
        super.accessibilityActivate()
        copyAction()
        return true
    }
    
    func copyAction() {
        UIPasteboard.general.string = copyContent
        if UIAccessibility.isVoiceOverRunning {
            
            Task {
                await UIAccessibility.announceString(for: "전화번호 복사됨")
            }
        }
    }
}
