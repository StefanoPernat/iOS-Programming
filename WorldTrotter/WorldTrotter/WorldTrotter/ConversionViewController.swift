//
//  ConversionViewController.swift
//  WorldTrotter
//
//  this view controller menages the conversion between fahrenheit and celsius,
//  is the main viewController of the WorldTrotter App
//
//  Created by Stefano Pernat on 30/08/17.
//  Copyright © 2017 Stefano Pernat. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController {
    // IBOutlets
    @IBOutlet weak var celsiusLabel: UILabel!
    @IBOutlet weak var fahrenheitTextField: UITextField!
    
    // IBActions
    @IBAction func fahrenheitTextFieldEditingChanged(_ textField: UITextField) {
        //celsiusLabel.text = textField.text
        
        if let fahrenheitText = textField.text, !fahrenheitText.isEmpty {
            celsiusLabel.text = fahrenheitText
        } else {
            celsiusLabel.text = "???"
        }
    }
}
