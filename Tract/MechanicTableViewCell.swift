//
//  MechanicTableViewCell.swift
//  Tract
//
//  Created by Divine Davis on 11/17/15.
//  Copyright © 2015 Juniper Street. All rights reserved.
//

import UIKit

class MechanicTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    @IBOutlet weak var ratingsControl: Ratings!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
