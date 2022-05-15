//
//  SignUpView.swift
//  Blogging-App
//
//  Created by Amanda Detofol on 15/05/22.
//

import UIKit

protocol SignUpViewDelegate {
    func handleAlreadyAnUserButtonTap()
    func handleCreateAccountButtonTap()
}

class SignUpView: UIView {
    
    private let headerView: SignInHeaderView = {
        let header = SignInHeaderView()
        header.translatesAutoresizingMaskIntoConstraints = false
        return header
    }()
    
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "name"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .emailAddress
        return textField
    }()
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "email"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .emailAddress
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "password"
        textField.borderStyle = .roundedRect
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.isSecureTextEntry = true 
        return textField
    }()
    
    private let createAccountButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Create account", for: .normal)
        button.backgroundColor = .lightGray
        button.titleLabel?.textColor = .white
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(handleCreateAccount), for: .touchUpInside)
        return button
    }()
    
    private let alreadyAnUserButon: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Already a user? Go to login", for: .normal)
        button.backgroundColor = .systemBackground
        button.titleLabel?.textColor = .systemPurple
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(handleAlreaduUser), for: .touchUpInside)
        return button
    }()
    
    var delegate: SignUpViewDelegate?
    
    init(){
        super.init(frame: .zero)
        self.setupView()
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func getEmailData() -> String? {
        return emailTextField.text
    }
    
    func getPasswordData() -> String? {
        return passwordTextField.text
    }
    
    func getNameData() -> String? {
        return nameTextField.text
    }
    
    // MARK: Private methods
    private func setupView(){
        self.addSubview(headerView)
        self.addSubview(nameTextField)
        self.addSubview(emailTextField)
        self.addSubview(passwordTextField)
        self.addSubview(createAccountButton)
        self.addSubview(alreadyAnUserButon)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            headerView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 70),
            
            nameTextField.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 32),
            nameTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            nameTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            nameTextField.heightAnchor.constraint(equalToConstant: 48),
            
            emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 32),
            emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            emailTextField.heightAnchor.constraint(equalToConstant: 48),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 16),
            passwordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            passwordTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            passwordTextField.heightAnchor.constraint(equalToConstant: 48),
            
            createAccountButton.bottomAnchor.constraint(equalTo: alreadyAnUserButon.topAnchor),
            createAccountButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            createAccountButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            createAccountButton.heightAnchor.constraint(equalToConstant: 48),
            
            alreadyAnUserButon.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            alreadyAnUserButon.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            alreadyAnUserButon.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            alreadyAnUserButon.heightAnchor.constraint(equalToConstant: 48),
            
        ])
    }
    
}

extension SignUpView {
    
    @objc func handleCreateAccount(){
        self.delegate?.handleCreateAccountButtonTap()
    }
    
    @objc func handleAlreaduUser(){
        self.delegate?.handleAlreadyAnUserButtonTap()
    }
    
}
