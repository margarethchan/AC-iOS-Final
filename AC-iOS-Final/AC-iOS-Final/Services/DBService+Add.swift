//
//  DBService+Add.swift
//  AC-iOS-Final
//
//  Created by C4Q on 2/26/18.
//  Copyright © 2018 C4Q . All rights reserved.
//
import UIKit
import Foundation
import FirebaseDatabase

extension DBService {
    
    public func addPost(withImage image: UIImage, comment: String) {
        let ref = postsRef.childByAutoId()
//        let post = Post(image: <#T##UIImage#>, comment: <#T##String#>, userID: <#T##String#>)
    }
    
}
