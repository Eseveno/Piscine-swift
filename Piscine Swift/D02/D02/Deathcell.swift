//
//  Deathcell.swift
//  D02
//
//  Created by Erwan SEVENO on 10/5/16.
//  Copyright © 2016 Erwan SEVENO. All rights reserved.
//

import UIKit

class Deathcell: UITableViewCell {
    
    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var How: UILabel!
    @IBOutlet weak var Year: UILabel!
    
    var death:(String, String, String)? {
        didSet{
            if let d = death {
                Name.text = String(d.0)
                How.text = String(d.1)
                Year.text = String(d.2)
            }
        }
    }
    
    
}
