//
//  DetailViewController.swift
//  GeoGoals
//
//  Created by 2020-1 on 12/3/19.
//  Copyright © 2019 Enrique García. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class DetailViewController: UIViewController {
    
    var chosen: goal!
    
    @IBOutlet weak var headline: UILabel!
    @IBOutlet weak var detailed: UILabel!
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var check: UIImageView!
    @IBOutlet weak var checkButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.headline.text = chosen.name
        self.detailed.text = chosen.description
        self.photo.image = UIImage(named:"photos/" + chosen.image)
        showState()
    
    }
    
    
    @IBAction func checkin(_ sender: UIButton) {
        let tolerance = 0.002028
        let whereAt = currentLocation.getLocation()
        if whereAt.latitude >= chosen.latitude-tolerance, whereAt.latitude <= chosen.latitude+tolerance, whereAt.longitude >= chosen.longitude-tolerance, whereAt.longitude <= chosen.longitude+tolerance{
            allStates[chosen.listId-1].completed[chosen.id-1] = true
            var all = true
            print(allStates[chosen.listId-1].completed.count)
            for oneState in allStates[chosen.listId-1].completed{
                if oneState == false{
                    all = false
                }
            }
            allStates[chosen.listId-1].all = all
            saveToFile()
            showState()
        }else{
            print("Tienes que estar en el lugar")
        }
        
    }
    
    func showState(){
        if allStates[chosen.listId-1].completed[chosen.id-1]{
            self.check.image = UIImage(named: "icons/checked")
            checkButton.backgroundColor = .lightGray
            checkButton.isEnabled = false
        }else{
            self.check.image = UIImage(named: "icons/unchecked")
            checkButton.backgroundColor = .orange
        }
        
    }
    

        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "toMap" {
            let vc = segue.destination as! MapViewController
            vc.chosen = chosen
        }
    }
    
    
    
}
