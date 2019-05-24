//
//  ChatViewController.swift
//  ParseChat
//
//  Created by Wade Li on 3/25/19.
//  Copyright © 2019 Wade Li. All rights reserved.
//

import UIKit
import Parse
import MessageInputBar
import AlamofireImage

class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MessageInputBarDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textF: UITextField!
    var flag: Bool = false
//    var list: [String] = []
//    var chat = [String]()
//    let commentB = MessageInputBar()
//    var showsCB = false
    var selectedP: PFObject!

    override func viewDidLoad() {
        super.viewDidLoad()
//        friend()
//        check()
        tableView.delegate = self
        tableView.dataSource = self
//        tableView.rowHeight = UITableView.automaticDimension
//        tableView.estimatedRowHeight = 150
//        get()
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatCell") as! ChatCell
        cell.contextL.text = "Hi"
        return cell
    }

    @IBAction func onSend(_ sender: Any) {
        if self.flag {
            let chatMessage = PFObject(className: "Message")
            chatMessage["text"] = textF.text ?? ""
            chatMessage.saveInBackground { (success, error) in
                if success {
                    print("The message was saved!")
                    self.textF.text = ""
                } else if let error = error {
                    print("Problem saving message: \(error.localizedDescription)")
                }
            }
        }
        tableView.reloadData()
    }

//    func friend(){
//        let query = PFQuery(className: "Info")
//        query.selectKeys(["Friend"])
//        query.findObjectsInBackground { (objects: [PFObject]?, error: Error?) in
//            if let error = error {
//                print(error.localizedDescription)
//            } else {
//                for object in objects! {
//                    self.list = object.object(forKey: "Friend") as! [String]
//                }
//            }
//        }
//    }

//    func check(){
//        if list.count == 0 {
//            flag = false
//        }
//        else {
//            flag = true
//        }
//    }
    
//    func get() {
//        let query = PFQuery(className: "Messange")
//        query.selectKeys(["text"])
//        query.findObjectsInBackground { (objects: [PFObject]?, error: Error?) in
//            if let error = error {
//                print(error.localizedDescription)
//            } else {
//                for object in objects! {
//                    self.chat.append(object.object(forKey: "text") as! String)
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
