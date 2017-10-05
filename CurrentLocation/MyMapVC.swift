//
//  MyMapVC.swift
//  CurrentLocation
//
//  Created by appinventiv on 04/10/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//

import UIKit
import GoogleMaps
import CoreLocation

class MyMapVC: UIViewController, CLLocationManagerDelegate {

    
    @IBOutlet weak var myView: UIView!
    
    var locationManager = CLLocationManager()
    
    var mapView = GMSMapView()
 
    var camera = GMSCameraPosition()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
      
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.showCurrentLocationOnMap()
        self.locationManager.stopUpdatingLocation()
    }
    
    
    func showCurrentLocationOnMap() {
        let camera = GMSCameraPosition.camera(withLatitude: (self.locationManager.location?.coordinate.latitude)!, longitude: (self.locationManager.location?.coordinate.longitude)!, zoom: 14)
        
        let mapView = GMSMapView.map(withFrame:  CGRect(x: 0, y: 0, width: self.myView.frame.size.width, height: self.myView.frame.size.height) , camera: camera)
       mapView.settings.myLocationButton = true
        mapView.isMyLocationEnabled = true
        
        let marker = GMSMarker()
        marker.position = camera.target
        marker.snippet = "Current Location"
        marker.appearAnimation = GMSMarkerAnimation.pop
        marker.map = mapView
        marker.title = "Hello"
        self.myView.addSubview(mapView)
    }
}
