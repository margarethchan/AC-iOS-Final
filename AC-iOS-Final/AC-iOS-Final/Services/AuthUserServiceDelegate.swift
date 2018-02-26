//
//  AuthUserServiceDelegate.swift
//  AC-iOS-Final
//
//  Created by C4Q on 2/26/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import Foundation
import Firebase

@objc protocol AuthUserServiceDelegate: class {
    
    @objc optional func didLogin(_ authUserService: AuthUserService)
    
    @objc optional func didFailLogin(_ authUserService: AuthUserService, error: Error)
    
}
