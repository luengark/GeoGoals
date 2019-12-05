//
//  GoalsViewController.swift
//  GeoGoals
//
//  Created by 2020-1 on 11/15/19.
//  Copyright © 2019 Enrique García. All rights reserved.
//

import UIKit

class GoalsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    var listId: Int!
    var goalset: [goal] = []
    var sel = 0
    
    @IBOutlet weak var goalTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        sel = 0
        goalTable.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count = 0
        for goal in goals{
            if goal.listId == self.listId{
                count += 1
            }
        }
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "goalcell", for: indexPath) as! ListTableViewCell
        while(true){
            if goals[sel].listId == self.listId{
                cell.listname.text = goals[sel].name
                cell.icon.image = UIImage(named:"photos/" + goals[sel].image)
                if allStates[listId-1].completed[indexPath.row]{
                    cell.accessoryType = .checkmark
                }
                self.goalset.append(goals[sel])
                sel += 1
                break
            }else{
                sel += 1
                }
            if sel == goals.count{
                break
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let chosen = goalset[indexPath.row]
        performSegue(withIdentifier: "toDetail", sender: chosen)

        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            let vc = segue.destination as! DetailViewController
            vc.chosen = sender as? goal
        }
    }
}
