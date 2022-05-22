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
    
    private let container = Storage.storage()
    
    private init(){}
    
    public func uploadUserProfilePicture(email: String,
                                         image: UIImage?,
                                         completion: @escaping(Bool)->Void) {
        
        let path = email
            .replacingOccurrences(of: "@", with: "_")
            .replacingOccurrences(of: ".", with: "_")
        
        guard let pngData = image?.pngData() else { return }
        
        container
            .reference(withPath: "profile_pictures/\(path)/photo.png")
            .putData(pngData) { storageMetadata, error in
                guard error == nil, storageMetadata != nil else {
                    completion(false)
                    return 
                }
                completion(true)
            }
        
    }
    
    
    public func downloadProfilePictureUrl(path: String, completion: @escaping(URL?)->Void){
        container.reference(withPath: path)
            .downloadURL { url, _ in
                completion(url)
            }
    }
    
    public func uploadUserPostHeaderPicture(image: UIImage?,
                                            blogPost: BlogPost,
                                            completion: @escaping(Bool)->Void) {
        
        
    }
    
    
    public func downloadPostHeaderPictureUrl(blogPost: BlogPost, completion: @escaping(URL?)->Void){
        
    }
    
}
