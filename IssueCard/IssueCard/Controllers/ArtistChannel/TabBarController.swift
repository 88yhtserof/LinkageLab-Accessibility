//
//  TabBarController.swift
//  IssueCard
//
//  Created by 링키지랩 on 10/31/24.
//

import UIKit

final class TabBarController: UITabBarController {
    
    private let artistListVC: UIViewController = {
        let vc = UINavigationController(rootViewController: ArtistListViewController())
        let image = UIImage(systemName: "info.circle.fill")
        vc.tabBarItem = UITabBarItem(title: "아티스트", image: image, tag: 0)
        return vc
    }()
    
    private let mapInfoVC: UIViewController = {
        let vc = UINavigationController(rootViewController: MapInfoViewController())
        let image = UIImage(systemName: "map.fill")
        vc.tabBarItem = UITabBarItem(title: "지도 정보", image: image, tag: 0)
        return vc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [artistListVC, mapInfoVC]
        view.backgroundColor = .white
    }
    
    @objc func didTapBackButton() {
        navigationController?.popViewController(animated: true)
    }
}
