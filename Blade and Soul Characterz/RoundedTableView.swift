//
//  RoundedTableView.swift
//  Blade and Soul Characterz
//
//  Created by Standa Sučanský on 05/02/16.
//  Copyright © 2016 Standa Sučanský. All rights reserved.
//

import UIKit

class RoundedTableView: UITableView {

    override func awakeFromNib() {
        self.layer.cornerRadius = 7
    }
}
