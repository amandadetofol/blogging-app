//
//  AuthManager.swift
//  Blogging-App
//
//  Created by Amanda Detofol on 13/05/22.
//

import Foundation
import FirebaseAuth

final class AuthManager {
    
    private let shared = AuthManager()
    
    private let auth = Auth.auth()
    
    public var isSignedIn: Bool {
        return auth.currentUser != nil
    }
    
    private init(){}
    
    public func signUp(email: String,
                       password: String,
                       completion: @escaping (Bool)->Void) {
        
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty,
              password.count >= 6 else {
            return
        }
        
        auth.createUser(withEmail: email, password: password) { data, error in
            guard data != nil, error == nil else {
                completion(false)
                return
            }
            completion(true)
        }
    }
    
    
    
    public func signIn(email: String,
                       password: String,
                       completion: @escaping (Bool)->Void) {
        
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty,
              password.count >= 6 else {
            return
        }
        
        auth.signIn(withEmail: email, password: password) { data, error in
            guard data != nil, error == nil else {
                completion(false)
                return
            }
            completion(true)
        }
        
    }
    
    public func signOut(completion: (Bool)->Void) {
        
        do {
            try self.auth.signOut()
            completion(true)
        } catch let error {
            print(error.localizedDescription)
            completion(false)
        }
        
    }
    
}
