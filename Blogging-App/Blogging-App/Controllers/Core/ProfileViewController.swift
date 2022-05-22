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
        tableView.isUserInteractionEnabled = true
        return tableView
    }()
    
    private var user: User?
    private let currentEmail: String
    private let authManager =  AuthManager()
    private let databaseManagaer = DatabaseManager()
    private let storageManager = StorageManager.shared
    private let userBlogPosts: [BlogPost] = []
    
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
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.setupNavigationController()
        self.fetchProfileData()
    }
    
    // MARK: Private methods
    private func fetchProfileData(){
        databaseManagaer.getUser(email: currentEmail) { user in
            guard let profileReference = user?.profilePictureRef,
                  let fullName = user?.name else {
                return
            }
            self.user = user
            DispatchQueue.main.async {
                self.addHeaderViewToTable(image: profileReference, fullName: fullName)
            }
        }
    }
    
    private func addHeaderViewToTable(image: String, fullName: String){
        let headerView = ProfileHeaderView()
        headerView.isUserInteractionEnabled = true
        headerView.frame  = CGRect(x: 0, y: 0, width: self.view.bounds.width + 50, height: self.view.bounds.width + 50)
        
        
        storageManager.downloadProfilePictureUrl(path: image) { url in
            guard let url = url else { return }
            
            headerView.configure(imageUrl: url, fullName: fullName, email: self.currentEmail)
            
        }
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
        
        guard let myEmail = UserDefaults.standard.string(forKey: "email"),
              myEmail == currentEmail else {
            return
        }
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Edit Profile",
                                                                style: .done,
                                                                target: self,
                                                                action: #selector(handleImageUpload))
    }
    
}

extension ProfileViewController: UITableViewDelegate {

}

extension ProfileViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.userBlogPosts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        cell.textLabel?.text = "teste"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let viewPostController = ViewPostViewController()
        viewPostController.title = userBlogPosts[indexPath.row].title
        self.navigationController?.pushViewController(viewPostController, animated: true)
    }
    
    private func getBlogPosts(){
        
    }
}

extension ProfileViewController {
    
    @objc func handleImageUpload() {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        picker.allowsEditing = true
        self.present(picker, animated: true, completion: nil )
    }
    
}

extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        guard let image = info[.editedImage] as? UIImage else { return }
        storageManager.uploadUserProfilePicture(email: self.currentEmail,
                                                image: image) { succeed in
            if succeed {
                //update database
                self.databaseManagaer.updateProfilePhoto(email: self.currentEmail) { succeed in
                    if succeed {
                        DispatchQueue.main.async {
                            self.fetchProfileData()
                        }
                    }
                }
                
            }
        }
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
