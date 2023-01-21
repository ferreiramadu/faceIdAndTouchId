//
//  SceneDelegate.swift
//  faceIdAndTouchId
//
//  Created by Maria Eduarda Ferreira Da Silva on 17/11/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    // o scene delegate é responsavel pelo o que é mostrado na tela, e com ele nos podemos manipular e gerenciar a forma como o aplicativo é exibido
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        self.window?.tintColor = UIColor(named: "pink")
        
        // definindo a primeira tela a ser exibida
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        let vc: UIViewController = ViewController() // no caso view controller
       
        // trabalhar com navigationController
        let navVC = UINavigationController(rootViewController: vc)
        window.rootViewController = navVC
        window.makeKeyAndVisible()
        self.window = window
    }
}
