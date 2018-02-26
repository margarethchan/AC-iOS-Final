//
//  DBService.swift
//  AC-iOS-Final
//
//  Created by C4Q on 2/26/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import Foundation
import FirebaseDatabase

class DBService: NSObject {
    private override init() {
        self.rootRef = Database.database().reference()
        self.postsRef = self.rootRef.child("posts")
        super.init()
    }
    
    static let manager = DBService()
    
    var rootRef: DatabaseReference!
    var postsRef: DatabaseReference!
}
