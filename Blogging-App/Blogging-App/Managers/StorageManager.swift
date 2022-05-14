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
    
    private let database = Storage.storage()
    
    private init(){}
    
}
