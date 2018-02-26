//
//  ViewController.swift
//  AC-iOS-Final
//
//  Created by C4Q  on 2/22/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var appNameLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        
        let email = emailTextField.text!
        let password = passwordTextField.text!
        
        AuthUserService.manager.delegate = self
        AuthUserService.manager.loginToAccount(withEmail: email, andPassword: password)
        // login func from firebase
        
        // alert if login successful
        
        // alert if login failed
    }
    
    @IBAction func registerButtonPressed(_ sender: UIButton) {
        
        let email = emailTextField.text!
        let password = passwordTextField.text!
        
        AuthUserService.manager.createNewAccount(withEmail: email, andPassword: password) { (user, error) in
            if let error = error {
                self.showAlert(title: "\(error.localizedDescription)", message: "")
                return
            }
            if let user = user {
                print("Email: \(user.email ?? "no email"), UserID: \(user.uid)")
                self.showAlert(title: "New Account for \(user.email ?? "no email") created", message: "")
            }
        }
        // create account func from firebase
        
        // alert if registration successful
        
        // alert if registration failed
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func tapOutsideTextfield(_ sender: UITapGestureRecognizer) {
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }
    
    
    
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { alert in }
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }


}

extension LoginViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.resignFirstResponder()
    }
}


extension LoginViewController: AuthUserServiceDelegate {
    func didFailLogin(_ authUserService: AuthUserService, error: Error) {
        self.showAlert(title: "Login Failed!", message: "\(error.localizedDescription)")
    }
    
    func didLogin(_ authUserService: AuthUserService) {
        
        self.showAlert(title: "Login Successful", message: "")
        // go to tab bar controller
        
    }
    
}
