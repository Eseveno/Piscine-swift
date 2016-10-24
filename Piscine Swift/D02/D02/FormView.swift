//
//  FormView.swift
//  D02
//
//  Created by Erwan SEVENO on 10/5/16.
//  Copyright © 2016 Erwan SEVENO. All rights reserved.
//

import UIKit

class FormView: UIViewController {

    @IBOutlet weak var Namefield: UITextField!
    @IBOutlet weak var Datefield: UIDatePicker!
    @IBOutlet weak var howfield: UITextView!
    @IBAction func Done(sender: UIBarButtonItem) {
        print(Namefield.text!)
        print(Datefield.date)
        print(howfield.text!)
    }


}
