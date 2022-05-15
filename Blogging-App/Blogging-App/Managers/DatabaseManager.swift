//
//  DatabaseManager.swift
//  Blogging-App
//
//  Created by Amanda Detofol on 13/05/22.
//

import Foundation
import FirebaseFirestore

final class DatabaseManager {
    
    static let shared = DatabaseManager()
    private let database = Firestore.firestore()
    
    private init(){}
    
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
        
    }
    
}
