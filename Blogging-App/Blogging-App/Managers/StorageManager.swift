//
//  StorageManager.swift
//  Blogging-App
//
//  Created by Amanda Detofol on 13/05/22.
//

import UIKit
import FirebaseStorage

final class StorageManager{
    
    static let shared = StorageManager()
    
    private let container = Storage.storage().reference()
    
    private init(){}
    
    public func uploadUserProfilePicture(email: String,
                                         image: UIImage?,
                                         completion: @escaping(Bool)->Void) {
        
        
    }
    
    
    public func downloadProfilePictureUrl(user: User, completion: @escaping(URL?)->Void){
        
    }
    
    public func uploadUserPostHeaderPicture(image: UIImage?,
                                            blogPost: BlogPost,
                                            completion: @escaping(Bool)->Void) {
        
        
    }
    
    
    public func downloadPostHeaderPictureUrl(blogPost: BlogPost, completion: @escaping(URL?)->Void){
        
    }
    
}
