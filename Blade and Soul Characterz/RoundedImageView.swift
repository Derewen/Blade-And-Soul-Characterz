//
//  RoundedImageView.swift
//  Blade and Soul Characterz
//
//  Created by Standa Sučanský on 06/02/16.
//  Copyright © 2016 Standa Sučanský. All rights reserved.
//

import UIKit

class RoundedImageView: UIImageView {

    override func awakeFromNib() {
        self.layer.cornerRadius = self.frame.size.width / 2
        self.clipsToBounds = true
    }
}
