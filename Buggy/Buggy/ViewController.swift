//
//  ViewController.swift
//  Buggy
//
//  Created by Stefano Pernat on 28/09/17.
//  Copyright © 2017 Stefano Pernat. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // IBActions
    @IBAction func switchToggled(_ sender: UISwitch) {
        print("Called buttonTapped(_:)")
    }
}

