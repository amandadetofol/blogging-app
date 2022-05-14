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
    
}
