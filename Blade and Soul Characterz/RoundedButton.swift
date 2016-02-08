//
//  RoundedButton.swift
//  Blade and Soul Characterz
//
//  Created by Standa Sučanský on 05/02/16.
//  Copyright © 2016 Standa Sučanský. All rights reserved.
//

import UIKit

class RoundedButton: UIButton {

    override func awakeFromNib() {
        if self.tag == 1 {
            self.layer.cornerRadius = 5
            }
        else { self.layer.cornerRadius = self.frame.size.width / 2 }
    }

}
