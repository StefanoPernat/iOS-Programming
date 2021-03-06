//
//  ItemStore.swift
//  Homepwner
//
//  Created by Stefano Pernat on 04/10/17.
//  Copyright © 2017 Stefano Pernat. All rights reserved.
//

import UIKit

class ItemStore {
    var allItems = [Item]()
    let itemArchivedURL: URL = {
        let documentsDirectories = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = documentsDirectories.first!
        
        return documentDirectory.appendingPathComponent("items.archive")
    }()
    
    // MARK: - ItemStore initialization
    init() {
        if let archivedItems = NSKeyedUnarchiver.unarchiveObject(withFile: itemArchivedURL.path) as? [Item] {
            allItems = archivedItems
        }
    }
    
    // MARK: - ItemStore main methods
    // adding new items to the store
    @discardableResult func createItem() -> Item {
        let newItem = Item(random: true)
        
        allItems.append(newItem)
        
        return newItem
    }
    
    // remove an existing item from the store
    func removeItem(_ item: Item) {
        if let index = allItems.index(of: item) {
            allItems.remove(at: index)
        }
    }
    
    // change position of an item
    func moveItem(from fromIndex: Int, to toIndex: Int){
        if fromIndex == toIndex {
            return
        }
        
        // get the item to move
        let movedItem = allItems[fromIndex]
        
        // remove the item from the old position
        allItems.remove(at: fromIndex)
        
        // insert the old item to the new position
        allItems.insert(movedItem, at: toIndex)
    }
    
    func saveChanges() -> Bool {
        print("saving items to: \(itemArchivedURL.path)")
        return NSKeyedArchiver.archiveRootObject(allItems, toFile: itemArchivedURL.path)
    }
}
