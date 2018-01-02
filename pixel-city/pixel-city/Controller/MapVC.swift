//
//  MapVC.swift
//  pixel-city
//
//  Created by Beverly on 1/01/18.
//  Copyright © 2018 Beverly. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation // manage location

class MapVC: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    var locationManager = CLLocationManager()
    let authorisationSatus = CLLocationManager.authorizationStatus()
    let regionRadius: Double = 1000
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        locationManager.delegate = self
        configureLocationServices()
    }

    
    @IBAction func centerMapButtonWasPressed(_ sender: Any) {
        if authorisationSatus == .authorizedAlways || authorisationSatus == .authorizedWhenInUse {
            centerMapOnUserLocation()
        }
    }
    

}

extension MapVC: MKMapViewDelegate {
    func centerMapOnUserLocation() {
        guard let coordination = locationManager.location?.coordinate else {return}
        _ = MKCoordinateRegionMakeWithDistance(coordination, regionRadius * 2.0, regionRadius * 2.0)
        
    }
}

extension MapVC: CLLocationManagerDelegate {
    func configureLocationServices() {
        if authorisationSatus == .notDetermined {
            locationManager.requestAlwaysAuthorization()
        } else {
            return
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        centerMapOnUserLocation()
    }
}
