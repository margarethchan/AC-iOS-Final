//
//  StorageService.swift
//  AC-iOS-Final
//
//  Created by C4Q on 2/26/18.
//  Copyright © 2018 C4Q . All rights reserved.
//
import UIKit
import Foundation
import FirebaseStorage

class StorageService {
    private init() {
        self.storageRef = Storage.storage().reference()
        self.imagesRef = storageRef.child("images")
    }
    
    static let manager = StorageService()
    
    private let storageRef: StorageReference!
    private let imagesRef: StorageReference!
    

    public func storePostImage(image: UIImage?, withPostID postID: String, completion: @escaping (_ error: String?, _ imageURL: String?) -> Void) {
        //should only store image if the user added one, else doesn't store image url for that post
        guard let image = image else {
            print("no image submitted")
            return
        }
        
        guard let uploadTask = StorageService.manager.storeImage(image, withImageID: postID, completion: completion) else {
            completion("Could not convert image to data", nil)
            return
        }
        
        //if success
        uploadTask.observe(.success) { (snapshot) in
            guard let downloadURL = snapshot.metadata?.downloadURL() else {
                print("could not get image download url")
                return
            }
            print("uploaded image")
//            let downloadURLString = downloadURL.absoluteString
//            DBService.manager.addImageURLToPost(url: downloadURLString, userID: userID)
//            completion(nil, downloadURLString)
        }
        
        //if fail
        uploadTask.observe(.failure) { (snapshot) in
            if let error = snapshot.error {
                print(error.localizedDescription)
            }
        }
    }
    
    func storeImage(_ image: UIImage, withImageID imageID: String, completion: @escaping (_ error: String?, _ imageURL: String?) -> Void) -> StorageUploadTask? {
        let ref = imagesRef.child(imageID)
        
        let imageData = UIImageJPEGRepresentation(image, 0.5)
        
        let metadata = StorageMetadata()
        
        metadata.contentType = "image/jpeg"
        
        return ref.putData(imageData!, metadata: metadata) { (_, error) in
            if let error = error {
                completion("Upload Task Error: \(error.localizedDescription)", nil)
            }
        }
    }
    
}

