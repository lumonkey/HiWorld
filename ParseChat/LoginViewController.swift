//
//  LoginViewController.swift
//  ParseChat
//  Saurav qwerty
//  Created by Wade Li on 3/25/19.
//  Copyright © 2019 Wade Li. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var emailF: UITextField!
    @IBOutlet weak var passwordF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSignUp(_ sender: Any) {
        let user = PFUser()
        user.username = emailF.text
        user.password = passwordF.text
        user.signUpInBackground { (success, error) in
            if success {
                self.performSegue(withIdentifier: "LoginSuccess", sender: nil)
            }
            else {
                print("Error: \(error?.localizedDescription)")
            }
        }
    }
    
    @IBAction func onLogin(_ sender: Any) {
        let username = emailF.text!
        let password = passwordF.text!
        PFUser.logInWithUsername(inBackground: username, password: password)
        { (user, error) in
            if user != nil {
                self.performSegue(withIdentifier: "LoginSuccess", sender: nil)
            }
            else {
                print("Error: \(error?.localizedDescription)")
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
