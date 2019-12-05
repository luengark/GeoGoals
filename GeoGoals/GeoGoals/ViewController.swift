//
//  ViewController.swift
//  GeoGoals
//
//  Created by 2020-1 on 11/15/19.
//  Copyright © 2019 Enrique García. All rights reserved.
//

import UIKit
import MapKit

let currentLocation = location()

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if !loadFromFile() {
            allStates = []
            for oneList in lists{
                var oneState = state()
                for oneGoal in goals{
                    if oneGoal.listId == oneList.id{
                        oneState.completed.append(false)
                    }
                }
                allStates.append(oneState)
            }
            saveToFile()
        }
        
        currentLocation.startLocationManager()
        
        
        /*allStates[6].completed[0] = false
        allStates[0].all = false
        saveToFile()*/
        
    }

}
