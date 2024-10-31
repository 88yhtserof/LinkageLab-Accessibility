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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [artistChannerlVC]
    }
}
