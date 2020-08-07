//
//  SceneDelegate.swift
//  StarWarsApp
//
//  Created by Joao Campos on 8/7/20.
//  Copyright © 2020 Joao Campos. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let sceneWindow = (scene as? UIWindowScene) else { return }
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.windowScene = sceneWindow
        
        let navC = UINavigationController()
        let vc = MainViewController()
        navC.pushViewController(vc, animated: false)
        
        self.window?.rootViewController = navC
        self.window?.makeKeyAndVisible()
    }


}

