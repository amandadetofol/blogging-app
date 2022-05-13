//
//  ProfileViewController.swift
//  Blogging-App
//
//  Created by Amanda Detofol on 13/05/22.
//

import UIKit

class ProfileViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.setupNavigationController()
    }
    
    // MARK: Private methods
    private func setupView(){
        self.view.backgroundColor = .systemBackground
    }
    
    private func setupNavigationController(){
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sign Out",
                                                                 style: .done,
                                                                 target: self,
                                                                 action: #selector(handleSignOutButtonTap))
    }
    
}

extension ProfileViewController {
    
    @objc func handleSignOutButtonTap(){
        
    }
    
}
