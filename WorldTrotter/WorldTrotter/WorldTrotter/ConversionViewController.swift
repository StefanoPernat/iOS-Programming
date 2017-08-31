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
    // Model
    var fahrenheitValue: Measurement<UnitTemperature>? {
        didSet {
            updateCelsiusLabel()
        }
    }
    
    var celsiusValue: Measurement<UnitTemperature>? {
        if let fahrenheitDegrees = fahrenheitValue {
            return fahrenheitDegrees.converted(to: .celsius)
        } else {
            return nil
        }
    }
    
    // format number to display 1 digit as precision
    let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    
    // IBOutlets
    @IBOutlet weak var celsiusLabel: UILabel!
    @IBOutlet weak var fahrenheitTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateCelsiusLabel()
    }
    
    // IBActions
    @IBAction func fahrenheitTextFieldEditingChanged(_ textField: UITextField) {
        //celsiusLabel.text = textField.text
        
        if let fahrenheitText = textField.text, let value = Double(fahrenheitText) {
            fahrenheitValue = Measurement(value: value, unit: .fahrenheit)
        } else {
            fahrenheitValue = nil
        }
    }
    
    // Dismiss the keyboard
    @IBAction func dismissKeyboard(_ sender: UIGestureRecognizer) {
        fahrenheitTextField.resignFirstResponder()
    }
    
    func updateCelsiusLabel() {
        if let celsiusDegrees = celsiusValue {
            //celsiusLabel.text = "\(celsiusDegrees.value)"
            celsiusLabel.text = numberFormatter.string(from: NSNumber(value: celsiusDegrees.value))
        } else {
            celsiusLabel.text = "???"
        }
    }
}
