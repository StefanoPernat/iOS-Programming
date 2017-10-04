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
        
        let imageView = UIImageView(image: UIImage(named: "4"))
        tableView.backgroundView = imageView
        
        // insert a padding between table view contents and status bar
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Items with a value above 50$"
        } else if section == 1 {
            return "All other items"
        }
        
        return nil
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numberOfItemsAbove50 = itemStore.getNumberOfItemsWithValue(above: 50)
        print(section)
        if section == 0 {
            return numberOfItemsAbove50
        } else if section == 1 {
            return itemStore.allItems.count - numberOfItemsAbove50
        } else {
            return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section  < 2 {
            return CGFloat(60.0)
        }
        
        return CGFloat(44.0)
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // create an instance of UITableViewCell with default appearence
        // update to reuse identifier
        let itemsWithPriceAbove50 = itemStore.splitsItemsAboveValue(50).0
        let allOtherItems = itemStore.splitsItemsAboveValue(50).1
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        
        // retrive the item that correspond at the nth row of the tableview
        var item: Item
        if indexPath.section == 0 {
            item = itemsWithPriceAbove50[indexPath.row]
            // set the cell's textLabel and detailText label to the corresponding item's name and value
            cell.textLabel?.text = item.name
            cell.detailTextLabel?.text = "$\(item.valueInDollars)"
            cell.textLabel?.font.withSize(20)
            cell.detailTextLabel?.font.withSize(20)
        } else if indexPath.section == 1 {
            item = allOtherItems[indexPath.row]
            // set the cell's textLabel and detailText label to the corresponding item's name and value
            cell.textLabel?.text = item.name
            cell.detailTextLabel?.text = "$\(item.valueInDollars)"
            cell.textLabel?.font.withSize(20)
            cell.detailTextLabel?.font.withSize(20)
        } else {
            cell.textLabel?.text = "No other items"
            cell.detailTextLabel?.text = ""
        }
        
        return cell
    }
}
