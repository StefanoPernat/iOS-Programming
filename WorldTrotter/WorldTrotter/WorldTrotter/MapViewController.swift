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
    weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    var locationIndex = 0
    var favoriteLocations = [MKPointAnnotation]()
    
    override func loadView() {
        // when the MapViewController is created I will create a MapView programmatically
        // and set this as the main view of MapViewController
        mapView = MKMapView()
        view = mapView
        
        favoriteLocations.append(createPointAnnotationWith("Where I'm born", atLatitude: 46.0747793, andLongitude: 11.121748600000046))
        favoriteLocations.append(createPointAnnotationWith("In pineta con Patty", atLatitude: 45.823386, andLongitude: 10.960835999999972))
        favoriteLocations.append(createPointAnnotationWith("Where I'm now", atLatitude: 45.8691, andLongitude: 11.073840000000018))
        
        setupControlsAndConstraints()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("MapViewController loaded its view")
        mapView.delegate = self
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
        
        // Add button for silver challenge
        let findMeButton = UIButton(type: .system)
        findMeButton.setTitle("Find Me", for: .normal)
        findMeButton.backgroundColor = UIColor(red: 225.0/255, green: 88.0/255, blue: 41.0/255, alpha: 1.0)
        findMeButton.setTitleColor(UIColor.white, for: .normal)
        findMeButton.layer.borderWidth = 1.0
        findMeButton.layer.borderColor = UIColor(red: 95.0/255, green: 94.0/255, blue: 95.0/255, alpha: 1.0).cgColor
        findMeButton.translatesAutoresizingMaskIntoConstraints = false
        findMeButton.layer.cornerRadius = 10
        findMeButton.contentEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        
        findMeButton.addTarget(self, action: #selector(findMeTapped(_:)), for: .touchUpInside)
        
        view.addSubview(findMeButton)
        
        let buttonBottomConstraint = findMeButton.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor, constant: -10)
        let buttonTrailingConstraint = findMeButton.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        
        buttonBottomConstraint.isActive = true
        buttonTrailingConstraint.isActive = true
        
        // Adding button for Gold Challenges
        let nextLocationButton = UIButton(type: .system)
        nextLocationButton.setTitle("Show Next Location", for: .normal)
        nextLocationButton.backgroundColor = UIColor(red: 225.0/255, green: 88.0/255, blue: 41.0/255, alpha: 1.0)
        nextLocationButton.setTitleColor(UIColor.white, for: .normal)
        nextLocationButton.layer.borderWidth = 1.0
        nextLocationButton.layer.borderColor = UIColor(red: 95.0/255, green: 94.0/255, blue: 95.0/255, alpha: 1.0).cgColor
        nextLocationButton.layer.cornerRadius = 10
        nextLocationButton.translatesAutoresizingMaskIntoConstraints = false
        nextLocationButton.contentEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        
        view.addSubview(nextLocationButton)
        
        let nextButtonBottomConstraint = nextLocationButton.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor, constant: -10)
        let nextButtonLeadingConstraint = nextLocationButton.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        
        nextButtonBottomConstraint.isActive = true
        nextButtonLeadingConstraint.isActive = true
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
    
    func findMeTapped(_ sender: UIButton) {
        print("\((sender.titleLabel?.text)!): find me is tapped")
        locationManager.requestWhenInUseAuthorization()
        mapView.showsUserLocation = !mapView.showsUserLocation
    }
    
    func createPointAnnotationWith(_ title: String, atLatitude latitude: Double, andLongitude longitude: Double) -> MKPointAnnotation {
        let pin = MKPointAnnotation()
        
        pin.title = title
        pin.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
        return pin
    }
}

// extension, adding the MKMapViewDelegate
extension MapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        print("User Location is updated")
        let region = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 500, 500)
        mapView.setRegion(region, animated: true)
    }
}
