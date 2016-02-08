//
//  ViewController.swift
//  Blade and Soul Characterz
//
//  Created by Standa Sučanský on 05/02/16.
//  Copyright © 2016 Standa Sučanský. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        DataService.instance.loadCharacters()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "onCharactersLoaded", name: "OnCharactersLoaded", object: nil)
    }
    
    override func viewDidAppear(animated: Bool) {
        tableView.reloadData()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let character = DataService.instance.loadedCharacters[indexPath.row]
        if let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as? CharCell {
        
            cell.configureCell(character)
            
            return cell
        }else {
            let cell = CharCell()
            cell.configureCell(character)
            return cell
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        DataService.instance.setCharacterIndex(indexPath.row)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instance.loadedCharacters.count
    }
    
    func onCharactersLoaded() {
        tableView.reloadData()
    }
    
}

