//
//  Form.swift
//  D02
//
//  Created by Erwan SEVENO on 10/5/16.
//  Copyright © 2016 Erwan SEVENO. All rights reserved.
//

import Foundation

import UIKit

class FormView: UIViewController{
    
    @IBOutlet weak var Namefield: UITextField!
    @IBOutlet weak var datefield: UIDatePicker!
    @IBOutlet weak var howfield: UITextView!
    
    @IBAction func Done(sender: UIBarButtonItem) {
        print("toto")
    }
}