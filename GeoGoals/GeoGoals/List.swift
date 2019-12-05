//
//  List.swift
//  GeoGoals
//
//  Created by 2020-1 on 11/15/19.
//  Copyright © 2019 Enrique García. All rights reserved.
//

import Foundation

struct list: Codable{
    let id: Int
    let name: String
    let image: String
}


let path_list = Bundle.main.path(forResource: "lists", ofType: "json")
let jsonData_list = NSData(contentsOfFile: path_list!)
let lists = try! JSONDecoder().decode([list].self, from: jsonData_list! as Data)
