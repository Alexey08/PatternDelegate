//
//  AppDelegate.swift
//  PatternDelegate
//
//  Created by Алексей Уланов on 25.09.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        let firstVC = FirstViewController()
        let firstNavC = UINavigationController(rootViewController: firstVC)
        
        window?.rootViewController = firstNavC
        window?.makeKeyAndVisible()
        
        return true
    }
}

