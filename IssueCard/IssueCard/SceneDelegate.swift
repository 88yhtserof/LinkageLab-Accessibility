//
//  SceneDelegate.swift
//  IssueCard
//
//  Created by 링키지랩 on 10/15/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(windowScene: windowScene)
        
        let rootViewController = OutlineViewController()
        self.window?.rootViewController = UINavigationController(rootViewController: rootViewController)
        self.window?.makeKeyAndVisible()
    }
}

