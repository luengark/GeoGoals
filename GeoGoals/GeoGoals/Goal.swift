//
//  Goal.swift
//  GeoGoals
//
//  Created by 2020-1 on 12/2/19.
//  Copyright © 2019 Enrique García. All rights reserved.
//

import Foundation
import MapKit

struct goal: Codable{
    let id: Int
    let listId: Int
    let name: String
    let image: String
    let description: String
    let latitude: CLLocationDegrees
    let longitude: CLLocationDegrees
}

let path = Bundle.main.path(forResource: "goals", ofType: "json")
let jsonData = NSData(contentsOfFile: path!)
let goals = try! JSONDecoder().decode([goal].self, from: jsonData! as Data)
