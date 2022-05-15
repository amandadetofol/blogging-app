//
//  SignInHeaderView.swift
//  Blogging-App
//
//  Created by Amanda Detofol on 15/05/22.
//

import UIKit

class SignInHeaderView: UIView {
    
    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "think")
        image.backgroundColor = .white
        image.clipsToBounds = true
        image.layer.cornerRadius = 30
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Explore millions of articles!"
        label.font  =  .systemFont(ofSize: 16)
        label.textAlignment = .center
        return label
    }()
    
    init(){
        super.init(frame: .zero)
        self.setupView()
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    //MARK: Private methods
    private func setupView(){
        self.clipsToBounds = true
        self.addSubview(image)
        self.addSubview(label)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: self.topAnchor),
            image.heightAnchor.constraint(equalToConstant: 60),
            image.widthAnchor.constraint(equalToConstant: 60),
            image.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            
            label.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            label.leadingAnchor.constraint(equalTo: image.trailingAnchor),
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32),
        ])
    }
}
