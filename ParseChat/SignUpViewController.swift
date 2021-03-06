//
//  SignUpViewController.swift
//  ParseChat
//
//  Created by Wade Li on 4/25/19.
//  Copyright © 2019 Wade Li. All rights reserved.
//

import UIKit
import Parse

class SignUpViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailF: UITextField!
    @IBOutlet weak var passwordF: UITextField!
    @IBOutlet weak var password2F: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailF.delegate = self
        passwordF.delegate = self
        passwordF.isSecureTextEntry = true
        password2F.delegate = self
        password2F.isSecureTextEntry = true
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSignUp(_ sender: Any) {
        let user = PFUser()
        user.username = emailF.text
        user.password = passwordF.text
        if(emailF.text!.isEmpty || passwordF.text!.isEmpty || password2F.text!.isEmpty){
            let alertController = UIAlertController(title:"Missing Info", message: "All the fields must be fill", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
            }
            alertController.addAction(OKAction)
            present(alertController, animated: true, completion: nil)
        }
        else if(passwordF.text != password2F.text) {
            let alertController = UIAlertController(title:"Re-enter Password", message: "The passwords do not match", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
            }
            alertController.addAction(OKAction)
            present(alertController, animated: true, completion: nil)
            
            
        }
        else{
            user.signUpInBackground { (success, error) in
                if success {
                    self.performSegue(withIdentifier: "SignUpSuccess", sender: nil)
                }
                else {
                    let alertController = UIAlertController(title:"Email Found", message: "Use another email", preferredStyle: .alert)
                    let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                    }
                    alertController.addAction(OKAction)
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
