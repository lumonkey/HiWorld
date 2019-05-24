//
//  LoginViewController.swift
//  ParseChat
//
//  Created by Wade Li on 3/25/19.
//  Copyright © 2019 Wade Li. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailF: UITextField!
    @IBOutlet weak var passwordF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailF.delegate = self
        passwordF.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onLogin(_ sender: Any) {
        let username = emailF.text!
        let password = passwordF.text!
        if(emailF.text!.isEmpty || passwordF.text!.isEmpty){
            let alertController = UIAlertController(title:"Missing Info", message: "All the fields must be fill", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
            }
            alertController.addAction(OKAction)
            present(alertController, animated: true, completion: nil)
        }
        else {
            PFUser.logInWithUsername(inBackground: username, password: password)
            { (user, error) in
                if user != nil {
                    self.performSegue(withIdentifier: "LoginSuccess", sender: nil)
                }
                else {
                    let alertController = UIAlertController(title:"Login Fail", message: "Invalid username/password.", preferredStyle: .alert)
                    let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                    }
                    alertController.addAction(OKAction)
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
    
    @IBAction func onEditing(_ sender: Any) {
        if passwordF.text!.isEmpty {
            passwordF.isHidden = false
        }
        else {
            passwordF.isHidden = true
        }
    }
    
    @IBAction func onFYP(_ sender: Any) {
        self.performSegue(withIdentifier: "PasswordChange", sender: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        emailF.resignFirstResponder()
        passwordF.resignFirstResponder()
        return true
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
