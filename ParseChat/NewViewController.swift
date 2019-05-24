//
//  NewViewController.swift
//  ParseChat
//
//  Created by Wade Li on 5/24/19.
//  Copyright © 2019 Wade Li. All rights reserved.
//

import UIKit
import Parse

class NewViewController: UIViewController {

    @IBOutlet weak var imageV: UIImageView!
    @IBOutlet weak var nameF: UILabel!
    var name: String = ""
    var pic: UIImage = UIImage()
    var list: [String] = []
    var flag: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        friend()
        nameF.text = name
        imageV.image = pic
        check()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onHi(_ sender: Any) {
        if flag {
            let alertController = UIAlertController(title:"Friendship", message: "You and \(nameF.text) are already friend", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
            }
            alertController.addAction(OKAction)
            self.present(alertController, animated: true, completion: nil)
        }
        else {
            let info = PFObject(className: "Message")
            info["text"] = "Hi"
            info.saveInBackground { (success, error) in
                if success {
                    print("success")
                }
                else {
                    print(error?.localizedDescription)
                }
            }
            self.performSegue(withIdentifier: "SayHi", sender: nil)
        }
    }
    
    func friend(){
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
                        self.list = info!["Friend"] as! [String]
                    }
                }
            }
        }
    }
    
    func check() {
        for l in list {
            if l == nameF.text! {
                flag = true
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
