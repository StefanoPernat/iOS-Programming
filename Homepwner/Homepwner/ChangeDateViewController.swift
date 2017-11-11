//
//  ChangeDateViewController.swift
//  Homepwner
//
//  Created by Stefano Pernat on 11/11/17.
//  Copyright © 2017 Stefano Pernat. All rights reserved.
//

import UIKit

class ChangeDateViewController: UIViewController {
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var item: Item!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        datePicker.date = item.dateCreated
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        item.dateCreated = datePicker.date
    }
}
