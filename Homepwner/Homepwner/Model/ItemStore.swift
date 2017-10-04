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
    
    @discardableResult func createNewItem() -> Item {
        let newItem = Item(random: true)
        
        allItems.append(newItem)
        
        return newItem
    }
}
