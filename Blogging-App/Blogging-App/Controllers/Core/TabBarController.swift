//
//  TabBarController.swift
//  Blogging-App
//
//  Created by Amanda Detofol on 13/05/22.
//

import UIKit

class TabBarController: UITabBarController {
    
    private let homeViewController: HomeViewController = {
        let home = HomeViewController()
        home.title = "Home"
        home.navigationItem.largeTitleDisplayMode = .always
        home.tabBarItem = UITabBarItem(title: "Home",
                                       image: UIImage(systemName: "house"),
                                       tag: 0)
        return home
    }()
    
    private let profileViewController: ProfileViewController = {
        let profile = ProfileViewController(currentEmail: UserDefaults.standard.string(forKey: "email") ?? "")
        profile.title = "Profile"
        profile.navigationItem.largeTitleDisplayMode = .always
        profile.tabBarItem = UITabBarItem(title: "Profile",
                                       image: UIImage(systemName: "person.circle"),
                                       tag: 0)
        return profile
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
   
    // MARK: Private methods
    private func setupView(){
        let home = UINavigationController(rootViewController:  homeViewController)
        home.navigationBar.prefersLargeTitles = true
        
        let profile = UINavigationController(rootViewController:  profileViewController)
        profile.navigationBar.prefersLargeTitles = true 
        
        self.setViewControllers([home, profile], animated: true)
    }
    
    
}
