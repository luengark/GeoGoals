//
//  ListsViewController.swift
//  GeoGoals
//
//  Created by 2020-1 on 11/15/19.
//  Copyright © 2019 Enrique García. All rights reserved.
//

import UIKit

class ListsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var listTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        listTable.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listcell", for: indexPath) as! ListTableViewCell
        
        cell.listname.text = lists[indexPath.row].name
        cell.icon.image = UIImage(named:"icons/" + lists[indexPath.row].image)
        if allStates[indexPath.row].all == true{
            cell.accessoryType = .checkmark
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let listId = lists[indexPath.row].id
        performSegue(withIdentifier: "toGoals", sender: listId)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toGoals" {
            let vc = segue.destination as! GoalsViewController
            vc.listId = sender as? Int
        }
    }
}
