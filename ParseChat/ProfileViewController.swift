//
//  ProfileViewController.swift
//  ParseChat
//
//  Created by Wade Li on 4/16/19.
//  Copyright © 2019 Wade Li. All rights reserved.
//

import UIKit
import Parse

class ProfileViewController: UIViewController {

    @IBOutlet weak var profileView: UIImageView!
    @IBOutlet weak var usernameL: UILabel!
    @IBOutlet weak var userIDL: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onLogout(_ sender: Any) {
    }
    
    @IBAction func onMyPosts(_ sender: Any) {
    }
    
    @IBAction func onSettings(_ sender: Any) {
    }
    
    @IBAction func onChangeName(_ sender: Any) {
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