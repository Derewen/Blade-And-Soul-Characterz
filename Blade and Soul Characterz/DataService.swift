//
//  DataService.swift
//  Blade and Soul Characterz
//
//  Created by Standa Sučanský on 07/02/16.
//  Copyright © 2016 Standa Sučanský. All rights reserved.
//

import Foundation
import UIKit

class DataService {
    static let instance = DataService()
    
    private var _loadedCharacters = [Character]()
    private var currentElementID: Int?
    
    var loadedCharacters: [Character] {
        return _loadedCharacters
    }
    
    func addCharacter(char: Character) {
        _loadedCharacters.append(char)
        saveCharacters()
        loadCharacters()
    }
    
    func loadCharacters() {
        if let charData = NSUserDefaults.standardUserDefaults().objectForKey("chars") as? NSData {
            if let charArr = NSKeyedUnarchiver.unarchiveObjectWithData(charData) as? [Character] {
                _loadedCharacters = charArr
            }
        }
        NSNotificationCenter.defaultCenter().postNotification(NSNotification(name:"charLoaded", object: nil))
    }
    
    func getCurrentCharacter() -> Character {
        return _loadedCharacters[currentElementID!]
    }
    
    func removeCharacter() {
        _loadedCharacters.removeAtIndex(currentElementID!)
        saveCharacters()
        loadCharacters()
    }
    
    func setCharacterIndex(elementID: Int) {
        self.currentElementID = elementID
    }
    
    func saveCharacters() {
        let charData = NSKeyedArchiver.archivedDataWithRootObject(_loadedCharacters)
        NSUserDefaults.standardUserDefaults().setObject(charData, forKey: "chars")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    func saveImgAndCreatePath(image: UIImage) -> String {
        let imgData = UIImagePNGRepresentation(image)
        let imgPath =  "image\(NSDate.timeIntervalSinceReferenceDate()).png"
        let fullPath = documentsPathForFileName(imgPath)
        imgData?.writeToFile(fullPath, atomically: true)
        return imgPath
    }
    
    func imageForPath(path: String) -> UIImage? {
        let fullPath = documentsPathForFileName(path)
        //print("Path: " + path + "\n")
        //print("Full Path: " + fullPath)
        let img = UIImage(named: fullPath)
        return img
    }
    
    func documentsPathForFileName(name: String)-> String {
        let path = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let fullPath = path[0] as NSString
        return fullPath.stringByAppendingPathComponent(name)
    }
}