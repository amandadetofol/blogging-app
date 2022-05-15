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
    
}
