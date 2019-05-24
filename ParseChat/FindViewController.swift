//
//  FindViewController.swift
//  ParseChat
//
//  Created by Wade Li on 5/14/19.
//  Copyright © 2019 Wade Li. All rights reserved.
//

import UIKit
import Parse

class FindViewController: UIViewController {

    @IBOutlet weak var emailF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onCancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onContinue(_ sender: Any) {
//        if(emailF.text!.isEmpty) {
//            let alertController = UIAlertController(title:"Missing Info", message: "Enter your email", preferredStyle: .alert)
//            let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
//            }
//            alertController.addAction(OKAction)
//            present(alertController, animated: true, completion: nil)
//        }
//        else {
//            PFUser.requestPasswordResetForEmail(inBackground: emailF.text!)
//        }
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
