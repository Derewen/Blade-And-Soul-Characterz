
//
//  Character.swift
//  Blade and Soul Characterz
//
//  Created by Standa Sučanský on 05/02/16.
//  Copyright © 2016 Standa Sučanský. All rights reserved.
//

import Foundation
import UIKit

class Character: NSObject, NSCoding {
    
    private var _name: String!
    private var _desc: String!
    private var _imgPath: String!
    
    var name: String {
        return _name
    }
    
    var desc: String {
        return _desc
    }
    
    var imgPath: String {
        return _imgPath
    }
    
    init(imgPath: String, name: String, desc: String) {
        self._imgPath = imgPath
        self._name = name
        self._desc = desc
    }
    
    override init() {
        
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
        self._imgPath = aDecoder.decodeObjectForKey("imgPath") as? String
        self._desc = aDecoder.decodeObjectForKey("description") as? String
        self._name = aDecoder.decodeObjectForKey("name") as? String
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self._imgPath, forKey: "imgPath")
        aCoder.encodeObject(self._desc, forKey: "description")
        aCoder.encodeObject(self._name, forKey: "name")
    }
}
