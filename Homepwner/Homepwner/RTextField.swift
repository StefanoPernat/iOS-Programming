//
//  RTextField.swift
//  Homepwner
//
//  Created by Stefano Pernat on 08/11/17.
//  Copyright © 2017 Stefano Pernat. All rights reserved.
//
// Custon UITextField that will change border style when became and resign first responder

import UIKit

class RTextField: UITextField {
    override func becomeFirstResponder() -> Bool {
        let responder = super.becomeFirstResponder()
        borderStyle = .roundedRect
        return responder
    }
    
    override func resignFirstResponder() -> Bool {
        let responder = super.resignFirstResponder()
        borderStyle = .line
        return responder
    }
}
