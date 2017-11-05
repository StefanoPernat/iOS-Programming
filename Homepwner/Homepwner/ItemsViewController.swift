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
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 65
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return itemStore.allItems.count
        } else {
            return 1
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // create an instance of UITableViewCell with default appearence
        // update to reuse identifier
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell
        
        if indexPath.section == 0 {
            // retrive the item that correspond at the nth row of the tableview
            let item = itemStore.allItems[indexPath.row]
            
            // set the cell's textLabel and detailText label to the corresponding item's name and value
            cell.nameLabel.text = item.name
            cell.serialNumberLabel.text = item.serialNumber
            cell.valueLabel.text = "$\(item.valueInDollars)"
            cell.updateCellColors()
        } else {
            cell.nameLabel.font = cell.nameLabel.font.withSize(12)
            cell.nameLabel.text = "No more items..."
            cell.serialNumberLabel.text = nil
            cell.valueLabel.text = nil
        }
        
        return cell
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        // if tableView is asking to commit a delete command...
        if editingStyle == .delete, indexPath.section == 0 {
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
        
        //if editingStyle == .m
    }
    
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        if indexPath.section == 1 {
            return false
        } else {
            return true
        }
    }
    
    override func tableView(_ tableView: UITableView, targetIndexPathForMoveFromRowAt sourceIndexPath: IndexPath, toProposedIndexPath proposedDestinationIndexPath: IndexPath) -> IndexPath {
        // prevent UITableView's rows from moving underneath no more items row
        if proposedDestinationIndexPath.section == 1 {
            return sourceIndexPath
        }
        
        return proposedDestinationIndexPath
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        itemStore.moveItem(from: sourceIndexPath.row, to: destinationIndexPath.row)
    }
    
    // if no more items is tapped dont perform the segue
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if let section = tableView.indexPathForSelectedRow?.section, section == 1 {
            return false
        } else {
            return true
        }
    }
    
    // when the segue for DetailViewController is triggered
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "showItem"?:
            if let section = tableView.indexPathForSelectedRow?.section, section == 0 {
                if let row = tableView.indexPathForSelectedRow?.row {
                    // get the item  associated with the first section and the right row
                    let item = itemStore.allItems[row]
                    let detailViewController = segue.destination as! DetailViewController
                    detailViewController.item = item
                }
            }
        default:
            preconditionFailure("Unexpected segue identifier.")
        }
    }
    
    // IBActions
    @IBAction func addNewItem(_ sender: UIBarButtonItem) {
        // first create a new item
        let newItem = itemStore.createItem()
        
        // make a new IndexPath for the 0th section, last row
        if let index = itemStore.allItems.index(of: newItem){
            let indexPath = IndexPath(row: index, section: 0)
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
    }
}
