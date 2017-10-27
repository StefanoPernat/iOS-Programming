//
//  ItemCell.swift
//  Homepwner
//
//  Created by Stefano Pernat on 22/10/17.
//  Copyright © 2017 Stefano Pernat. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {
    // IBoutlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var serialNumberLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        nameLabel.adjustsFontForContentSizeCategory = true
        serialNumberLabel.adjustsFontForContentSizeCategory = true
        valueLabel.adjustsFontForContentSizeCategory = false
    }
    
    // function that sets the value label color based on the label's text
    func updateCellColors() {
        let greenColor = UIColor(red: 0, green: 128.0/255, blue: 0, alpha: 1)
        let redColor = UIColor(red: 255.0, green: 0, blue: 0, alpha: 1)
        let threshold = 50
        
        let stringValueInDollars = valueLabel.text
        
        if let valueInDollars = Int(stringValueInDollars!.replacingOccurrences(of: "$", with: "")) {
            if valueInDollars < threshold {
                valueLabel.textColor = redColor
            } else {
                valueLabel.textColor = greenColor
            }
        }
    }
}
