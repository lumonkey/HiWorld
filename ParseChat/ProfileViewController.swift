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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let query = PFQuery(className: "Info")
        query.whereKey("User", equalTo: PFUser.current()!)
        query.getFirstObjectInBackground { (objects: PFObject?, error: Error?) in
            if error != nil {
                let alertController = UIAlertController(title:"Error", message: "Fail to load", preferredStyle: .alert)
                let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                }
                alertController.addAction(OKAction)
                self.present(alertController, animated: true, completion: nil)
                self.dismiss(animated: true, completion: nil)
            }
            else {
                query.getObjectInBackground(withId: objects!.objectId!) { (info: PFObject?, error: Error?) in
                    if error != nil {
                       //Error
                    }
                    else {
                        self.usernameL.text = info!["Name"] as? String
                        //profile pic
                    }
                }
            }
        }
    }
        // Do any additional setup after loading the view.

    @IBAction func onLogout(_ sender: Any) {
        PFUser.logOut()
        let main = UIStoryboard(name: "Main", bundle: nil)
        let loginViewController = main.instantiateViewController(withIdentifier: "LoginViewController")
        let delegate = UIApplication.shared.delegate as! AppDelegate
        delegate.window?.rootViewController = loginViewController
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
