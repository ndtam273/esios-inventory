//
//  SceneDelegate.swift
//  es-inventory
//
//  Created by TAM NGUYEN DUC on 10/28/20.
//  Copyright © 2020 TAM NGUYEN DUC. All rights reserved.
//

import UIKit


@available(iOS 13.0, *)
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    static func shared()
        -> SceneDelegate{
            let scene = UIApplication.shared.connectedScenes.first
            return (scene?.delegate as? SceneDelegate)!
    }

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
       
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        
        //TabbarViewController
        let TabbarVC = TabbarController()
        window.rootViewController = TabbarVC
        
        
        self.window = window
        window.makeKeyAndVisible()
        
    }

    func sceneDidDisconnect(_ scene: UIScene) {
       
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
      
    }

    func sceneWillResignActive(_ scene: UIScene) {
    
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
   
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
      
    }


}

