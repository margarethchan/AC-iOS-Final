//
//  Post.swift
//  AC-iOS-Final
//
//  Created by C4Q on 2/26/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import Foundation
import UIKit

class Post: NSObject {
    let imageURL: String?
    let comment: String
    let userID: String
    let postID: String
    
    init(comment: String, userID: String) {
        self.comment = comment
        self.userID = userID
        self.postID = ""
        self.imageURL = ""
    }
    
    init(imageURL: String?, comment: String, userID: String, postID: String) {
        self.imageURL = imageURL ?? ""
        self.comment = comment
        self.userID = userID
        self.postID = postID
    }
}
