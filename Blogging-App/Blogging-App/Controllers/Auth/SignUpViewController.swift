//
//  SignUpViewController.swift
//  Blogging-App
//
//  Created by Amanda Detofol on 13/05/22.
//

import UIKit

class SignUpViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    
    //MARK: Private methods
    private func setupView(){
        self.title = "Create Account"
        self.view.backgroundColor = .systemBackground
    }
    
}
