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

class ConversionViewController: UIViewController, UITextFieldDelegate {
    // Model
    let darkColorHour = 15
    
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
        
        print("ConversionViewController loaded its view")
        
        updateCelsiusLabel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // change background color based on the part of the day
        let currentHour = Calendar.current.component(.hour, from: Date())
        if currentHour > darkColorHour {
            view.backgroundColor = UIColor(red: 95.0/255, green: 94.0/255, blue: 95.0/255, alpha: 1.0)
        }
        
    }
    
    // IBActions
    @IBAction func fahrenheitTextFieldEditingChanged(_ textField: UITextField) {
        //celsiusLabel.text = textField.text
        
        if let fahrenheitText = textField.text,
            let number = numberFormatter.number(from: fahrenheitText) {
            fahrenheitValue = Measurement(value: number.doubleValue, unit: .fahrenheit)
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
    
    // Delegate for Fahrenheit UITextField
    // this won't allow to enter a multiple decimal separator in the fahrenheit text field
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        // based on the iphone locale I will set the decimal separator
        let currentLocale = Locale.current
        let decimalSeparator = currentLocale.decimalSeparator ?? "."
        
        let currentTextHasDecimalSeparator = textField.text?.range(of: decimalSeparator)
        let replacementTextHasDecimalSeparator = string.range(of: decimalSeparator)
        
        let lettersCharacterSet = CharacterSet.letters
        if string.rangeOfCharacter(from: lettersCharacterSet) != nil {
            return false
        }
        
        if currentTextHasDecimalSeparator != nil, replacementTextHasDecimalSeparator != nil {
            return false
        } else {
            return true
        }
    }
}
