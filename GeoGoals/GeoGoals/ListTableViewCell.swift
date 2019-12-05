//
//  ListTableViewCell.swift
//  GeoGoals
//
//  Created by 2020-1 on 12/2/19.
//  Copyright © 2019 Enrique García. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell{
    @IBOutlet weak var listname: UILabel!
    @IBOutlet weak var icon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
