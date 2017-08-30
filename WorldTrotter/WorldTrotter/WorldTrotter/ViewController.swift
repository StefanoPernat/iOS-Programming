//
//  ViewController.swift
//  WorldTrotter
//
//  Created by Stefano Pernat on 29/08/17.
//  Copyright © 2017 Stefano Pernat. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // adding view programmatically: first create a frame
        let firstFrame = CGRect(x: 160, y: 240, width: 100, height: 150)
        
        // adding view programmatically: first create a view with the frame passed into the initializer
        let firstView = UIView(frame: firstFrame)
        
        firstView.backgroundColor = UIColor.blue
        
        // adding view programmatically: adding the new view to the root view
        view.addSubview(firstView)
    }
}

