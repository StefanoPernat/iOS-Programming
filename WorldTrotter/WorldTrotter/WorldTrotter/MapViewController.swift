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
        
        setupControlsAndConstraints()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("MapViewController loaded its view")
    }
    
    func setupControlsAndConstraints() {
        let segmentedControl = UISegmentedControl(items: ["Standard", "Hybrid", "Satellite"])
        segmentedControl.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)
        
        // segmentedControl constraints
        let topConstraint = segmentedControl.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 8)
        
        //      Using margins
        let margins = view.layoutMarginsGuide
        let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        
        topConstraint.isActive = true
        leadingConstraint.isActive = true
        trailingConstraint.isActive = true
        
        // adding an action programmatically
        segmentedControl.addTarget(self, action: #selector(mapTypeChanged(_:)), for: .valueChanged)
    }
    
    func mapTypeChanged(_ segmentedControl: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .hybrid
        case 2:
            mapView.mapType = .satellite
        default:
            break
        }
    }
}
