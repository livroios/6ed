//
//  CarroCell.swift
//  Carros
//
//  Created by Ricardo Lecheta on 6/28/14.
//  Copyright (c) 2014 Ricardo Lecheta. All rights reserved.
//

import UIKit

class CarroCell: UITableViewCell {
    
    @IBOutlet var cellNome : UILabel!
    @IBOutlet var cellDesc : UILabel!
    @IBOutlet var cellImg : UIImageView!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: UITableViewCellStyle.value1, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
