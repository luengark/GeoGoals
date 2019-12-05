//
//  location.swift
//  GeoGoals
//
//  Created by 2020-1 on 12/4/19.
//  Copyright © 2019 Enrique García. All rights reserved.
//

import Foundation
import MapKit

class location{
   
    var locationManager = CLLocationManager()
    var locValue = CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0)
    
    func startLocationManager()
    {
        locationManager.delegate = self as? CLLocationManagerDelegate
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    
    func getLocation() -> CLLocationCoordinate2D{
        locValue = locationManager.location?.coordinate ?? CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0)
        return locValue
    }
    
    
}

