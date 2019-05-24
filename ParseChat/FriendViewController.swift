//
//  FriendViewController.swift
//  ParseChat
//
//  Created by Wade Li on 4/8/19.
//  Copyright © 2019 Wade Li. All rights reserved.
//

import UIKit
import Parse

class FriendViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

//    var list: [String] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
//        friend();
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell") as! FriendCell
       //cell.photoView =
        cell.usernameL.text = "Bob"
        return cell
    }

//    func friend(){
//        let query = PFQuery(className: "Info")
//        query.whereKey("User", equalTo: PFUser.current()!)
//        query.getFirstObjectInBackground { (objects: PFObject?, error: Error?) in
//            if error != nil {
//                let alertController = UIAlertController(title:"Error", message: "Fail to get user", preferredStyle: .alert)
//                let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
//                }
//                alertController.addAction(OKAction)
//                self.present(alertController, animated: true, completion: nil)
//            }
//            else {
//                query.getObjectInBackground(withId: objects!.objectId!) { (info: PFObject?, error: Error?) in
//                    if error != nil {
//                        let alertController = UIAlertController(title:"Error", message: "Fail to load", preferredStyle: .alert)
//                        let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
//                        }
//                        alertController.addAction(OKAction)
//                        self.present(alertController, animated: true, completion: nil)
//                    }
//                    else {
//                        self.list = info!["Friend"] as! [String]
//                    }
//                }
//            }
//        }
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
