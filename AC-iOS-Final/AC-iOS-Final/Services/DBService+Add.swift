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
        guard let currentUser = AuthUserService.manager.getCurrentUser() else {
            print("No current user id, please exit the app and log back in.")
            return
        }
        let ref = postsRef.childByAutoId()
        let post = Post(image: image, comment: comment, userID: currentUser.uid, postID: ref.key)
        
        ref.setValue(["userID": post.userID,
                      "comment": post.comment
        ]) { (error, _) in
            if let error = error {
                print("Failed to add post")
            } else {
                print("New post added to database")
            }
        }
        StorageService.manager.storePostImage(image: image, withPostID: post.postID) { (errorMessage, _) in
            if let errorMessage = errorMessage {
                print(errorMessage)
            }
        }
    }
    
}
