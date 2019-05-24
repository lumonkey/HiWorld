//
//  SettingViewController.swift
//  ParseChat
//
//  Created by Wade Li on 5/12/19.
//  Copyright © 2019 Wade Li. All rights reserved.
//

import UIKit
import Parse
import AlamofireImage

class SettingViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate  {

    @IBOutlet weak var picV: UIImageView!
    @IBOutlet weak var nameChangeF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameChangeF.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onCancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onUpdate(_ sender: Any) {
        let image1 = UIImage(named: "photo-placeholder")
        let image2 = picV.image!
        let query = PFQuery(className: "Info")
        query.whereKey("User", equalTo: PFUser.current()!)
        query.getFirstObjectInBackground { (objects: PFObject?, error: Error?) in
            if error != nil {
                let alertController = UIAlertController(title:"Error", message: "Fail to get user", preferredStyle: .alert)
                let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                }
                alertController.addAction(OKAction)
                self.present(alertController, animated: true, completion: nil)
                self.dismiss(animated: true, completion: nil)
            }
            else {
                if !(image1!.isEqual(image2)) || !(self.nameChangeF.text!.isEmpty) {
                    query.getObjectInBackground(withId: objects!.objectId!) { (info: PFObject?, error: Error?) in
                        if let info = info {
                            if !(image1!.isEqual(image2)) {
                                let imageData = self.picV.image!.pngData()
                                let file = PFFileObject(data: imageData!)
                                info["Image"] = file
                            }
                            if !(self.nameChangeF.text!.isEmpty) {
                                info["Name"] = self.nameChangeF.text!
                            }
                            info.saveInBackground()
                        }
                    }
                }
            }
        }
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onCamera(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            picker.sourceType = .camera
        }
        else {
            picker.sourceType = .photoLibrary
        }
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.editedImage] as! UIImage
        let size = CGSize(width: 150, height: 150)
        let scaledI = image.af_imageScaled(to: size)
        picV.image = scaledI
        dismiss(animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameChangeF.resignFirstResponder()
        return true
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//    }

}
