//
//  AuthUserService.swift
//  AC-iOS-Final
//
//  Created by C4Q on 2/26/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase


class AuthUserService: NSObject {
    private override init() {
        super.init()
        self.auth = Auth.auth()
    }
    
    static let manager = AuthUserService()
    private var auth: Auth!
    weak public var delegate: AuthUserServiceDelegate?
    
    // Create New Account
    public func createNewAccount(withEmail email: String, andPassword password: String, completion: @escaping AuthResultCallback) {
        auth.createUser(withEmail: email, password: password, completion: completion)
    }
    
    // Log In to Existing Account
    public func loginToAccount(withEmail email: String, andPassword password: String) {
        auth.signIn(withEmail: email, password: password) { (user, error) in
            if let error = error {
                self.delegate?.didFailLogin!(self, error: error)
                return
            }
            if let user = user {
                self.delegate?.didLogin!(self)
            }
        }
    }
    
    // Get current user
    public func getCurrentUser() -> User? {
        return auth.currentUser
    }
    
    // Signs the current user out of the app and Firebase.
    public func signOut() {
        do {
            try auth.signOut()
        } catch {
            print(error)
        }
    }
    
}

