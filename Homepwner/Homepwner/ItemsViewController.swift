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
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        // if tableView is asking to commit a delete command...
        if editingStyle == .delete {
            let item = itemStore.allItems[indexPath.row]
            
            // prompt to the user an alert and ask him for confirmation while deleting
            let title = "Delete \(item.name)?"
            let message = "Are you sure you want to delete this item?"
            
            let deleteAlertController = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            let deleteAction = UIAlertAction(title: "Remove", style: .destructive, handler: {[unowned self] (action) -> Void in
                // moved statements to remove item inside delete action closure
                self.itemStore.removeItem(item)
                self.tableView.deleteRows(at: [indexPath], with: .automatic)
            })
            
            //adding action to UIAlertController
            deleteAlertController.addAction(cancelAction)
            deleteAlertController.addAction(deleteAction)
            
            // present to the user the UIAlertController
            present(deleteAlertController, animated: true, completion: nil)
        }
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        itemStore.moveItem(from: sourceIndexPath.row, to: destinationIndexPath.row)
    }
    
    // IBActions
    @IBAction func addNewItem(_ sender: UIButton) {
        // first create a new item
        let newItem = itemStore.createItem()
        
        // make a new IndexPath for the 0th section, last row
        if let index = itemStore.allItems.index(of: newItem){
            let indexPath = IndexPath(row: index, section: 0)
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
    }
    
    @IBAction func toggleEditingMode(_ sender: UIButton) {
        if isEditing { // in editing mode, change title and turn off editing
            sender.setTitle("Edit", for: .normal)
            setEditing(false, animated: true)
        } else {    // not in editing mode change title and turn on editing
            sender.setTitle("Done", for: .normal)
            setEditing(true, animated: true)
        }
    }
}
