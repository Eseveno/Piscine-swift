//
//  lieucell.swift
//  D05
//
//  Created by Erwan SEVENO on 10/10/16.
//  Copyright © 2016 Erwan SEVENO. All rights reserved.
//

import UIKit

class lieucell: UITableViewCell {

    @IBOutlet weak var lieulab: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var lieu : String = ""
        {
        didSet{
            lieulab.text = lieu
        }
    }

}
