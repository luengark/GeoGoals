//
//  MapViewController.swift
//  GeoGoals
//
//  Created by 2020-1 on 12/3/19.
//  Copyright © 2019 Enrique García. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate{
    
    var chosen: goal!
    
    @IBOutlet weak var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let coord = CLLocationCoordinate2D(latitude: chosen.latitude, longitude: chosen.longitude)
        let annotation = MKPointAnnotation()
        annotation.title = chosen.name
        annotation.coordinate = coord
        map.delegate = self
        zoom(location: coord)
        map.addAnnotation(annotation)

    }
    
    let region: CLLocationDistance = 1400
    func zoom(location: CLLocationCoordinate2D)
    {
        let coordinateRegion = MKCoordinateRegion (center: location,latitudinalMeters: region, longitudinalMeters: region)
        map.setRegion(coordinateRegion, animated: true)
    }
    
}
