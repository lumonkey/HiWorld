//
//  SetupViewController.swift
//  ParseChat
//
//  Created by Wade Li on 5/11/19.
//  Copyright © 2019 Wade Li. All rights reserved.
//

import UIKit
import Parse
import AlamofireImage

class SetupViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var picV: UIImageView!
    @IBOutlet weak var nameF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameF.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSetUp(_ sender: Any) {
        if(nameF.text!.isEmpty){
            let alertController = UIAlertController(title:"Missing Name", message: "Please enter your name", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
            }
            alertController.addAction(OKAction)
            present(alertController, animated: true, completion: nil)
        }
        else{
            let info = PFObject(className: "Info")
            let a: [String] = []
            info["Name"] = nameF.text!
            info["User"] = PFUser.current()!
            let imageData = picV.image!.pngData()
            let file = PFFileObject(data: imageData!)
            info["Image"] = file
            info["X"] = 0.0
            info["Y"] = 0.0
            info["Friend"] = a
            info["Chat"] = a
            info.saveInBackground { (success, error) in
                if success {
                    self.performSegue(withIdentifier: "SetUpSuccess", sender: nil)
                }
                else {
                    let alertController = UIAlertController(title:"Error", message: "Try again later", preferredStyle: .alert)
                    let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                    }
                    alertController.addAction(OKAction)
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameF.resignFirstResponder()
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
