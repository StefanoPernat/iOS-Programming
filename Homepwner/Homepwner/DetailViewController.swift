//
//  File.swift
//  Homepwner
//
//  Created by Stefano Pernat on 27/10/17.
//  Copyright © 2017 Stefano Pernat. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    //IBoutlets
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var serialNumberField: UITextField!
    @IBOutlet weak var valueField: UITextField!
    @IBOutlet weak var dateLabel: UILabel!
    
    var item: Item!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        nameField.text = item.name
        serialNumberField.text = item.serialNumber
        valueField.text = "\(item.valueInDollars)"
        dateLabel.text = "\(item.dateCreated)"
    }
}