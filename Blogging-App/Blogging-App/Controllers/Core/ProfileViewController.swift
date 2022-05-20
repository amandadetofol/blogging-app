//
//  ProfileViewController.swift
//  Blogging-App
//
//  Created by Amanda Detofol on 13/05/22.
//

import UIKit

class ProfileViewController: UIViewController{
    
    private lazy var postsTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    private let currentEmail: String
    private let authManager =  AuthManager()
    
    init(currentEmail: String){
        self.currentEmail = currentEmail
        print(self.currentEmail)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.postsTableView.frame = self.view.bounds
        self.fetchProfileData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.setupNavigationController()
        self.addHeaderViewToTable()
    }
    
    // MARK: Private methods
    private func fetchProfileData(){
        
    }
    
    private func addHeaderViewToTable(){
        let headerView = ProfileHeaderView()
        headerView.frame  = CGRect(x: 0, y: 0, width: self.view.bounds.width + 50, height: self.view.bounds.width + 50)
        headerView.configure(image: "", fullName: "Teste", email: self.currentEmail)
        postsTableView.tableHeaderView = headerView
    }
    
    private func setupView(){
        self.view.addSubview(postsTableView)
    }
    
    private func setupNavigationController(){
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sign Out",
                                                                 style: .done,
                                                                 target: self,
                                                                 action: #selector(handleSignOutButtonTap))
    }
    
}

extension ProfileViewController: UITableViewDelegate {
    
}

extension ProfileViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        cell.textLabel?.text = "teste"
        return cell
    }
    
    
}

extension ProfileViewController {
    
    @objc func handleSignOutButtonTap(){
        authManager.signOut { sucess in
            if sucess {
                self.dismiss(animated: true)
                let signInViewController = SignInViewController()
                signInViewController.modalPresentationStyle = .fullScreen
                self.navigationController?.pushViewController(signInViewController, animated: true )
            }
        }
    }
    
}
