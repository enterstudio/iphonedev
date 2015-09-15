//
//  PartyLocationViewController.swift
//  PartiesTonight
//
//  Created by mike tihonchik on 9/14/15.
//  Copyright © 2015 AngryGuy. All rights reserved.
//

import UIKit
import MapKit

class PartyLocationViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var partyMap: MKMapView!
    
    let locationManager = CLLocationManager()
    let regionRadius: CLLocationDistance = 1000
    
    override func viewDidLoad() {
        self.locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let currentLocation = manager.location!.coordinate
        centerMapOnLocation(CLLocation(latitude: currentLocation.latitude, longitude: currentLocation.longitude))
    }
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2.0, regionRadius * 2.0)
        partyMap.setRegion(coordinateRegion, animated: true)
    }
}
