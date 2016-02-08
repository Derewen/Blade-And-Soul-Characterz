//
//  AddCharacterVC.swift
//  Blade and Soul Characterz
//
//  Created by Standa Sučanský on 06/02/16.
//  Copyright © 2016 Standa Sučanský. All rights reserved.
//

import UIKit

class AddCharacterVC: UIViewController,  UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    @IBOutlet weak var AddPictureBtn: UIButton!
    @IBOutlet weak var NameLab: UITextField!
    @IBOutlet weak var DescriptionLab: UITextField!
    @IBOutlet weak var AddBtn: RoundedButton!
    @IBOutlet weak var imgView: RoundedImageView!
    
    var imgPicker: UIImagePickerController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgPicker = UIImagePickerController()
        imgPicker.delegate = self
    }
    
    @IBAction func onAddBtnPressed(sender: AnyObject) {
        if let name = NameLab.text where name != "", let description = DescriptionLab.text where description != "", let img = imgView.image where imgView.image != nil {
            let imgPath = DataService.instance.saveImgAndCreatePath(img)
            let character = Character(imgPath: imgPath, name: name, desc: description)
            DataService.instance.addCharacter(character)
            dismissViewControllerAnimated(true, completion: nil)
        }
        
    }

    @IBAction func onAddPictureBtnPressed(sender: AnyObject) {
        presentViewController(imgPicker, animated: true, completion: nil)
        AddPictureBtn.setTitle("", forState: .Normal)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imgPicker.dismissViewControllerAnimated(true, completion: nil)
        imgView.image = image
    }
}
