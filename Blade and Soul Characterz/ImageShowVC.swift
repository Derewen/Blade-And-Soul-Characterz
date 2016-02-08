//
//  ImageShowVC.swift
//  Blade and Soul Characterz
//
//  Created by Standa Sučanský on 07/02/16.
//  Copyright © 2016 Standa Sučanský. All rights reserved.
//

import UIKit

class ImageShowVC: UIViewController {

    @IBOutlet weak var trashBtn: UIBarButtonItem!
    @IBOutlet weak var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        imgView.image = UIImage(named: DataService.instance.getCurrentCharacter().imgPath)
        self.navigationItem.title = DataService.instance.getCurrentCharacter().name
    }
    
    @IBAction func OnTrashButtonPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
        DataService.instance.removeCharacter()
    }
    
    
    
}
