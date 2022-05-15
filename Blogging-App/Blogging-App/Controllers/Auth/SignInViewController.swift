//
//  SignInViewController.swift
//  Blogging-App
//
//  Created by Amanda Detofol on 13/05/22.
//

import UIKit

class SignInViewController: UIViewController {
    
    private lazy var signInView = SignInView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    
    //MARK: Private methods
    private func setupView(){
        self.title = "Sign In"
        signInView.delegate = self
        self.view = signInView
    }
    
}

extension SignInViewController: SignInViewDelegate {
    
    func handleSignInButtonTap() {
        print("One")
    }
    
    func handleNotAnUserAlreadyButtonTap() {
        print("222")
    }
    
    
}
