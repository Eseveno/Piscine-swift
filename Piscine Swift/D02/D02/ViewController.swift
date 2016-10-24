//
//  ViewController.swift
//  D02
//
//  Created by Erwan SEVENO on 10/5/16.
//  Copyright © 2016 Erwan SEVENO. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var TableViewmort: UITableView!{
        didSet{
            TableViewmort.delegate = self
            TableViewmort.dataSource = self
        }
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Data.death.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("DeathCell") as! Deathcell
        cell.death = Data.death[indexPath.row]
        return cell
    }
    
    @IBOutlet weak var Namefield: UITextField!
    @IBOutlet weak var Datefield: UIDatePicker!
    @IBOutlet weak var Howfield: UITextView!
    
    @IBAction func Done(sender: UIBarButtonItem) {
        print(Namefield.text!)
        print(Datefield.date)
        print(Howfield.text!)
    }
    
    @IBAction func unWindSegue(segue: UIStoryboardSegue) {
     TableViewmort.reloadData()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "backSegue" {
            if segue.destinationViewController is ViewController{
                
                if Namefield.text != ""{
                    Data.death.append((Namefield.text!,Howfield.text!,String(Datefield.date)))}
            }
        }
    }
}
