//
//  AppDelegate.swift
//  Blogging-App
//
//  Created by Amanda Detofol on 13/05/22.
//

import UIKit
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        
        var navigationController: UINavigationController
        if AuthManager().isSignedIn{
            navigationController = UINavigationController(rootViewController: TabBarController())
        } else {
            navigationController = UINavigationController(rootViewController: SignInViewController())
            navigationController.navigationBar.prefersLargeTitles = true
        }
     
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = navigationController
        return true
    }

}

