//
//  StorageService.swift
//  AC-iOS-Final
//
//  Created by C4Q on 2/26/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import Foundation
import FirebaseStorage

class StorageService {
    private init() {
        self.storageRef = Storage.storage().reference()
        self.imagesRef = storageRef.child("images")
    }
    
    static let manager = StorageService()
    private let storageRef = StorageReference!
    private let imagesRef = StorageReference!
    
  
}
