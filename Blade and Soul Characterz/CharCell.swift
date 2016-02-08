//
//  CharCell.swift
//  Blade and Soul Characterz
//
//  Created by Standa Sučanský on 05/02/16.
//  Copyright © 2016 Standa Sučanský. All rights reserved.
//

import UIKit
import Foundation

class CharCell: UITableViewCell {
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var titleLab: UILabel!
    @IBOutlet weak var descLab: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        img.layer.cornerRadius = img.frame.size.width / 2
        img.clipsToBounds = true
    }
    
    func configureCell(character: Character) {
        titleLab.text = character.name
        descLab.text = character.desc
        img.image = DataService.instance.imageForPath(character.imgPath)
    }

}
