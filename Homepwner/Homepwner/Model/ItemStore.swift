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
}
