//
//  SignInViewController.swift
//  Blogging-App
//
//  Created by Amanda Detofol on 13/05/22.
//

import UIKit

class SignInViewController: UIViewController {
    
    private let authManager =  AuthManager()
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
        guard let email = signInView.getEmailData(),
              let password = signInView.getPasswordData() else {
            return
        }
        
        authManager.signIn(email: email, password: password) { success in
            if success {
                UserDefaults.standard.set(email, forKey: "email")
                let tabBarController = TabBarController()
                tabBarController.modalPresentationStyle = .fullScreen
                self.present(tabBarController, animated: true)
            }
        }
    }
    
    func handleNotAnUserAlreadyButtonTap() {
        let signUpViewController = SignUpViewController()
        self.navigationController?.pushViewController(signUpViewController, animated: true)
    }
    
    
}
