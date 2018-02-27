//
//  DBService+Get.swift
//  AC-iOS-Final
//
//  Created by C4Q on 2/26/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import Foundation
import FirebaseDatabase
import UIKit

extension DBService {
    
    public func getAllPosts(completion: @escaping (_ posts: [Post]) -> Void) {
        postsRef.observeSingleEvent(of: .value) { (dataSnapshot) in
            var posts: [Post] = []
            guard let postSnapshots = dataSnapshot.children.allObjects as? [DataSnapshot] else {
                return
            }
            for postSnapshot in postSnapshots {
                guard let postDict = postSnapshot.value as? [String: Any] else {
                    return
                }
                guard
                let caption = postDict["comment"] as? String,
                let userID = postDict["userID"] as? String,
//                let postID = postDict["postID"] as? String
                let imageURL = postDict["imageURL"] as? String
                else {
                    print("Couldn't get post")
                    return
                }
                let post = Post(imageURL: imageURL, comment: caption, userID: userID)
                posts.append(post)
            }
            completion(posts)
        }
    }
}
