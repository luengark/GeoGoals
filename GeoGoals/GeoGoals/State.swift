//
//  State.swift
//  GeoGoals
//
//  Created by 2020-1 on 12/4/19.
//  Copyright © 2019 Enrique García. All rights reserved.
//

import Foundation

struct state: Codable{
    var completed : [Bool]
    var all: Bool
    
    init(){
        self.completed = []
        self.all = false
    }
}



//let propertyListDecoder = PropertyListDecoder()
//var


