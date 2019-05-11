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

class ProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

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
    
    @IBAction func onPic(_ sender: Any) {
        let p = UIImagePickerController()
        p.delegate = self
        p.allowsEditing = true
    /*    if UIImagePickerController.isSourceTypeAvailable(.camera) {
            p.sourceType = .camera
        }
        else {  */
            p.sourceType = .photoLibrary
    //    }
        present(p, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.editedImage] as! UIImage
        let size = CGSize(width: 150, height: 150)
        let scaledI = image.af_imageScaled(to: size)
        profileView.image = scaledI
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
