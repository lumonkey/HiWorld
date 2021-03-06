//
//  ProfileViewController.swift
//  ParseChat
//
//  Created by Wade Li on 4/16/19.
//  Copyright © 2019 Wade Li. All rights reserved.
//

import UIKit
import Parse
import AlamofireImage

class ProfileViewController: UIViewController {

    @IBOutlet weak var profileView: UIImageView!
    @IBOutlet weak var usernameL: UILabel!
    @IBOutlet weak var userIDL: UILabel!
    
    override func viewDidAppear(_ animated: Bool) {
        self.display()
    }
    
    func display(){
        print("Hi")
        let query = PFQuery(className: "Info")
        query.whereKey("User", equalTo: PFUser.current()!)
        query.getFirstObjectInBackground { (objects: PFObject?, error: Error?) in
            if error != nil {
                let alertController = UIAlertController(title:"Error", message: "Fail to get user", preferredStyle: .alert)
                let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                }
                alertController.addAction(OKAction)
                self.present(alertController, animated: true, completion: nil)
            }
            else {
                query.getObjectInBackground(withId: objects!.objectId!) { (info: PFObject?, error: Error?) in
                    if error != nil {
                        let alertController = UIAlertController(title:"Error", message: "Fail to load", preferredStyle: .alert)
                        let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                        }
                        alertController.addAction(OKAction)
                        self.present(alertController, animated: true, completion: nil)
                    }
                    else {
                        self.usernameL.text = info!["Name"] as? String
                        let imageF = info!["Image"] as! PFFileObject
                        let urlS = imageF.url!
                        let url = URL(string: urlS)!
                        self.profileView.af_setImage(withURL: url)
                        self.userIDL.text = PFUser.current()?.username
                    }
                }
            }
        }
    }
    
    @IBAction func onLogout(_ sender: Any) {
        PFUser.logOut()
        let main = UIStoryboard(name: "Main", bundle: nil)
        let loginViewController = main.instantiateViewController(withIdentifier: "LoginViewController")
        let delegate = UIApplication.shared.delegate as! AppDelegate
        delegate.window?.rootViewController = loginViewController
    }
    
    @IBAction func onSettings(_ sender: Any) {
        self.performSegue(withIdentifier: "Change", sender: nil)
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
