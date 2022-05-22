//
//  DatabaseManager.swift
//  Blogging-App
//
//  Created by Amanda Detofol on 13/05/22.
//

import Foundation
import FirebaseFirestore

final class DatabaseManager {
    
    private let database = Firestore.firestore()
    
    init(){}
    
    public func insert(  post: BlogPost,
                         user: User,
                         completion: @escaping (Bool) -> Void) {
        
    }
    
    public func getAllPosts(completion: @escaping ([BlogPost]) -> Void) {
        
    }
    
    public func getPosts( for user: User,
                          completion: @escaping ([String]) -> Void) {
        
    }
    
    public func insert(user: User,
                       completion: @escaping (Bool) -> Void) {
        
        let userReference = user.email
            .replacingOccurrences(of: ".", with: "_")
            .replacingOccurrences(of: "@", with: "_")
        
        let data = [
            "email":user.email,
            "name": user.name
        ]
        
        database
            .collection("users")
            .document(userReference)
            .setData(data) { error in
                completion(error == nil)
            }
    }
    
    public func getUser(email: String, completion: @escaping(User?) -> Void) {
        let documentId = email
            .replacingOccurrences(of: ".", with: "_")
            .replacingOccurrences(of: "@", with: "_")
        
        database
            .collection("users")
            .document(documentId)
            .getDocument { document, error in
                guard let data = document?.data() as? [String: String],
                      let name = data["name"],
                      error == nil else {
                    return
                }
                let reference: String? = data["profile_photo"]
                let user = User(name: name, email: email, profilePictureRef: reference)
                completion(user)
            }
    }
    
    public func updateProfilePhoto(email: String, completion: @escaping(Bool) -> Void){
        let path = email
            .replacingOccurrences(of: "@", with: "_")
            .replacingOccurrences(of: ".", with: "_")
        
        let photoReference = "profile_pictures/\(path)/photo.png"
        
        let databaseReference = database
            .collection("users")
            .document(email)
        
        databaseReference.getDocument { documentSnapshot, error in
            guard var data = documentSnapshot?.data(), error == nil else {
                return
            }
            data["profile_photo"] = photoReference
            databaseReference.setData(data) { error in
                if let error = error {
                    completion(false)
                    return
                }
                completion(true)
            }
        }
    }
    
}

