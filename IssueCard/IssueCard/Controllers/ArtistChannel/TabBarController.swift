//
//  TabBarController.swift
//  IssueCard
//
//  Created by 링키지랩 on 10/31/24.
//

import UIKit

final class TabBarController: UITabBarController {
    
    private let artistChannerlVC: UIViewController = {
        let vc = ArtistChannelViewController()
        let image = UIImage(systemName: "info.circle.fill")
        vc.tabBarItem = UITabBarItem(title: "아티스트 채널", image: image, tag: 0)
        return vc
    }()
    
    
    lazy var rightBarButton: UIBarButtonItem = {
        var view = UIBarButtonItem()
        view.image = UIImage(systemName: "ellipsis")
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [artistChannerlVC]
        view.backgroundColor = .white
        
        navigationItem.rightBarButtonItem = rightBarButton
        navigationItem.hidesBackButton = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: self, action: #selector(didTapBackButton))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if UIAccessibility.isVoiceOverRunning,
           let leftBarButtonItem = navigationItem.leftBarButtonItem {
            navigationItem.leftBarButtonItem?.accessibilityLabel = "뒤로 가기"
            Task {
                try? await UIAccessibility.setFocus(to: leftBarButtonItem)
            }
        }
    }
    
    @objc func didTapBackButton() {
        navigationController?.popViewController(animated: true)
    }
}
