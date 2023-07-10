//
//  SceneDelegate.swift
//  Movies
//
//  Created by Ahmed Aly on 09/07/2023.
//

import SwiftUI

final class SceneDelegate: NSObject, UIWindowSceneDelegate {
            
    var window: UIWindow?
    var appRouter: AppRouting?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        appRouter = AppRouter.shared
        guard let navigationController = appRouter?.navigationController else { return }
        ListOfMoviesLauncher(sourceController: navigationController).launch()
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
