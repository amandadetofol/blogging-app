//
//  SignInView.swift
//  Blogging-App
//
//  Created by Amanda Detofol on 15/05/22.
//

import UIKit

protocol SignInViewDelegate {
    func handleSignInButtonTap()
    func handleNotAnUserAlreadyButtonTap()
}

class SignInView: UIView {
    
    private let headerView: SignInHeaderView = {
        let header = SignInHeaderView()
        header.translatesAutoresizingMaskIntoConstraints = false 
        return header
    }()
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "email"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .emailAddress
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "password"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private let signInButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Sign In", for: .normal)
        button.backgroundColor = .systemPurple
        button.titleLabel?.textColor = .white
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(handleSignIn), for: .touchUpInside)
        return button
    }()
    
    private let createAccountButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Create account", for: .normal)
        button.backgroundColor = .systemBackground
        button.titleLabel?.textColor = .systemPurple
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(handleCreateAccount), for: .touchUpInside)
        return button
    }()
    
    var delegate: SignInViewDelegate?
    
    init(){
        super.init(frame: .zero)
        self.setupView()
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: Private methods
    private func setupView(){
        self.addSubview(headerView)
        self.addSubview(emailTextField)
        self.addSubview(passwordTextField)
        self.addSubview(signInButton)
        self.addSubview(createAccountButton)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            headerView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 70),
            
            emailTextField.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 32),
            emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            emailTextField.heightAnchor.constraint(equalToConstant: 48),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 16),
            passwordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            passwordTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            passwordTextField.heightAnchor.constraint(equalToConstant: 48),
            
            signInButton.bottomAnchor.constraint(equalTo: createAccountButton.topAnchor),
            signInButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            signInButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            signInButton.heightAnchor.constraint(equalToConstant: 48),
            
            createAccountButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            createAccountButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            createAccountButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            createAccountButton.heightAnchor.constraint(equalToConstant: 48),
            
        ])
    }
    
}

extension SignInView {
    
    @objc func handleSignIn(){
        self.delegate?.handleSignInButtonTap()
    }
    
    @objc func handleCreateAccount(){
        self.delegate?.handleNotAnUserAlreadyButtonTap()
    }
    
}
