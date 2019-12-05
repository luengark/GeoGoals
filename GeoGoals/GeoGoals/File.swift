//
//  File.swift
//  GeoGoals
//
//  Created by 2020-1 on 12/4/19.
//  Copyright © 2019 Enrique García. All rights reserved.
//

import Foundation

var allStates : [state]!
let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
let archiveURL = documentsDirectory.appendingPathComponent("savefile").appendingPathExtension("plist")

func loadFromFile() -> Bool{
    let propertyListDecoder = PropertyListDecoder()
    if let retrievedData = try? Data(contentsOf: archiveURL){
        allStates = try? propertyListDecoder.decode(Array<state>.self, from: retrievedData)
        return true
    }else{
       return false
    }
}

func saveToFile(){
    let propertyListEncoder = PropertyListEncoder()
    let encodedStates = try? propertyListEncoder.encode(allStates)
    try? encodedStates?.write(to: archiveURL, options: .noFileProtection)
}
