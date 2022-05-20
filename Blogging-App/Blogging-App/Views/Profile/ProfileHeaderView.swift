//
//  ProfileHeaderView.swift
//  Blogging-App
//
//  Created by Amanda Detofol on 16/05/22.
//

import UIKit

class ProfileHeaderView: UIView {
    
    private lazy var profileImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "person.circle")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 150
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        return image
    }()
    
    private let fullNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 16)
        label.numberOfLines = 0
        return label
    }()
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    
    init(){
        super.init(frame: .zero)
        self.setupView()
        self.setuConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func configure(image: String, fullName: String, email: String){
        // do aditional setup for image
        self.fullNameLabel.text = fullName
        self.emailLabel.text = email
    }
    
    //MARK: Private methods
    private func setupView(){
        self.backgroundColor = .lightGray
        self.addSubview(profileImage)
        self.addSubview(fullNameLabel)
        self.addSubview(emailLabel)
    }
    
    private func setuConstraints(){
        NSLayoutConstraint.activate([
            profileImage.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 32),
            profileImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            profileImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32),
            profileImage.heightAnchor.constraint(equalToConstant: 300),
            
            fullNameLabel.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 16),
            fullNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            fullNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32),
            
            emailLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 16),
            emailLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            emailLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32),
        ])
    }
    
}
