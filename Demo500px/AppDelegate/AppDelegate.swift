//
//  AppDelegate.swift
//  Demo500px
//
//  Created by EsmaGO on 3/12/20.
//  Copyright © 2020 EsmaGO. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var appRouter: AppRouter?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let navController = UINavigationController()
        appRouter = AppRouter(with: navController)
        appRouter?.start()
        
        window?.rootViewController = navController
        
        return true
    }
}

