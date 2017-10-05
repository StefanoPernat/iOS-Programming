//
//  ItemsViewController.swift
//  Homepwner
//
//  Created by Stefano Pernat on 01/10/17.
//  Copyright © 2017 Stefano Pernat. All rights reserved.
//

import UIKit

class ItemsViewController: UITableViewController {
    var itemStore: ItemStore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // get the status bar height
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        
        // insert a padding between table view contents and status bar
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemStore.allItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // create an instance of UITableViewCell with default appearence
        // update to reuse identifier
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        
        // retrive the item that correspond at the nth row of the tableview
        let item = itemStore.allItems[indexPath.row]
        
        // set the cell's textLabel and detailText label to the corresponding item's name and value
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = "$\(item.valueInDollars)"
        
        return cell
    }
    
    // IBActions
    @IBAction func addNewItem(_ sender: UIButton) {
        
    }
    
    @IBAction func toggleEditingMode(_ sender: UIButton) {
        
    }
}
