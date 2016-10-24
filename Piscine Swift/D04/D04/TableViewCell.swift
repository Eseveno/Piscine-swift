//
//  TableViewCell.swift
//  D04
//
//  Created by Erwan SEVENO on 10/8/16.
//  Copyright © 2016 Erwan SEVENO. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var texte: UILabel!
    
    
    var tweet : Tweet?
        {
        didSet {
            if let f = tweet {
                name?.text = f.name
                texte?.text = f.text
                date?.text = f.date
            }
            
        }
    }

}
