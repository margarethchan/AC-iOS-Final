//
//  UploadViewController.swift
//  AC-iOS-Final
//
//  Created by C4Q on 2/26/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class UploadViewController: UIViewController, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var commentTextView: UITextView!
    
    @IBOutlet weak var invisibleCameraButton: UIButton!
    
    private var imagePickerVC = UIImagePickerController()
    
    @IBAction func invisibleAddPhotoButtonPressed(_ sender: UIButton) {
        print("Invisible Add Photo Button Pressed")
        present(imagePickerVC, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Upload Lomograph"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addPost))
        
        self.imageView.image = #imageLiteral(resourceName: "camera_icon")
        self.imageView.contentMode = .center
        self.imageView.layer.borderWidth = 0.5
        self.commentTextView.layer.borderWidth = 0.5
        

        
        
        commentTextView.delegate = self
        imagePickerVC.delegate = self
        imagePickerVC.sourceType = .photoLibrary
    }

    @objc private func addPost() {
        if let postCaption = self.commentTextView.text, postCaption != "Write about your Lomograph" {
            
            let image = self.imageView.image
            DBService.manager.addPost(withImage: image!, comment: postCaption)
            print("Post Added")
        } else {
            print("Failed to Add Post")
        }
    }
    
    public static func storyboardInstance() -> UINavigationController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let presentedVC = storyboard.instantiateViewController(withIdentifier: "UploadViewController") as! UploadViewController
        let navController = UINavigationController(rootViewController: presentedVC)
        return navController
    }

}

extension UploadViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = ""
        textView.becomeFirstResponder()
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        textView.resignFirstResponder()
    }
    
}


extension UploadViewController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let image = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            print("image is nil")
            return
        }
        self.imageView.image = image
        if self.imageView.image != #imageLiteral(resourceName: "camera_icon") {
            self.imageView.contentMode = .scaleAspectFit
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
