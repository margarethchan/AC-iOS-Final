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
    let image: UIImage
    let comment: String
    let userID: String
    let postID: String
    
    init(image: UIImage, comment: String, userID: String) {
        self.image = image
        self.comment = comment
        self.userID = userID
        self.postID = ""
    }
    
    init(image: UIImage, comment: String, userID: String, postID: String) {
        self.image = image
        self.comment = comment
        self.userID = userID
        self.postID = postID
    }
}
