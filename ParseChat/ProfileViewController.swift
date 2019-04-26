//
//  ProfileViewController.swift
//  ParseChat
//
//  Created by Wade Li on 4/16/19.
//  Copyright © 2019 Wade Li. All rights reserved.

import UIKit
import Parse

class ProfileViewController: UIViewController {

  @IBOutlet weak var profileView: UIImageView!
  @IBOutlet weak var usernameL: UILabel!
  @IBOutlet weak var usrtextF: UITextField!
  @IBOutlet weak var userIDL: UILabel!
    
  @IBOutlet weak var emailF: UITextField!
  @IBOutlet weak var passF: UITextField!
  @IBOutlet weak var passVF: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view.
    let user = PFUser.current()
    if((user) != nil){
      userIDL.text = user!["username"] as? String
      usernameL.text = user!["Name"] as? String
      emailF.text = user!["email"] as? String
      usrtextF.isHidden = true
      usrtextF.delegate = self as? UITextFieldDelegate
    }
  }
    
  @IBAction func onLogout(_ sender: Any) {
    if PFUser.current() != nil{
      PFUser.logOut()
      let main = UIStoryboard(name: "Main", bundle: nil)
      let login = main.instantiateViewController(withIdentifier: "LoginViewController") // put Login View Controller to go back
      let delegate = UIApplication.shared.delegate as! AppDelegate
   
      delegate.window?.rootViewController = login
    }
  }
    
  @IBAction func onMyPosts(_ sender: Any) {
  }
  
  @IBAction func onSettings(_ sender: Any) {
    //
  }
  
  @IBAction func onChangeName(_ sender: Any) {
    if(usernameL.isHidden){
//    if(!(usrtextF.text == usernameL.text)){
        let user = PFUser.current()
        user?["Name"] = usrtextF.text
        user?.saveInBackground()
        usernameL.text = usrtextF.text
        usernameL.isHidden = false
        usrtextF.isHidden = true
    } else{
      usernameL.isHidden = true
      usrtextF.isHidden = false
      usrtextF.text = usernameL.text
    }
  }

  @IBAction func onUpdate(_ sender: Any) {
    let user = PFUser.current()
    user?["email"] = emailF.text
    if( passF.text == passVF.text ){
      print("Password updated!")
      user?["password"] = passF.text
    } else{ print("Password must match!") }
    user?.saveInBackground()
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
