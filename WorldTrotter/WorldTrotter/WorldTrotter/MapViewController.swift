//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Stefano Pernat on 31/08/17.
//  Copyright © 2017 Stefano Pernat. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    var mapView: MKMapView!
    
    override func loadView() {
        // when the MapViewController is created I will create a MapView programmatically
        // and set this as the main view of MapViewController
        mapView = MKMapView()
        view = mapView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("MapViewController loaded its view")
    }
}
