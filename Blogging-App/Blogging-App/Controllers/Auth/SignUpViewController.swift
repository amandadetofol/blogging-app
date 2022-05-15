//
//  SignUpViewController.swift
//  Blogging-App
//
//  Created by Amanda Detofol on 13/05/22.
//

import UIKit

class SignUpViewController: UIViewController{
    
    private lazy var signUpView = SignUpView()
    private let authManager = AuthManager()
    private let databaseManager = DatabaseManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    
    //MARK: Private methods
    private func setupView(){
        self.title = "Create Account"
        self.signUpView.delegate = self
        self.view = signUpView
    }
    
}

extension SignUpViewController: SignUpViewDelegate {
    
    func handleAlreadyAnUserButtonTap() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func handleCreateAccountButtonTap() {
        guard let email = signUpView.getEmailData(),
              let password = signUpView.getPasswordData(),
              let name = signUpView.getNameData() else {
            return
        }
        
        authManager.signUp(email: email, password: password) { sucess in
            if sucess {
                self.databaseManager.insert(user: User(name: name,
                                                  email: email,
                                                  profilePictureUrl: nil)) { sucess in
                    if sucess {
                        DispatchQueue.main.async {
                            let tabBarController = TabBarController()
                            tabBarController.modalPresentationStyle = .fullScreen
                            self.present(tabBarController, animated: true)
                        }
                    } else {
                        print("Failed to create user in database!")
                    }
                    
                }
            } else {
                print("Failed to create user!")
            }
            
        }
    
    }
    
    
}
