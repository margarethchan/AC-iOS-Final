//
//  UploadViewController.swift
//  AC-iOS-Final
//
//  Created by C4Q on 2/26/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class UploadViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var commentTextView: UITextView!
    
    @IBAction func invisibleAddPhotoButtonPressed(_ sender: UIButton) {
        print("Invisible Add Photo Button Pressed")
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Upload Lomograph"
        self.imageView.layer.borderWidth = 0.5
        self.commentTextView.layer.borderWidth = 0.5
        commentTextView.delegate = self
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
