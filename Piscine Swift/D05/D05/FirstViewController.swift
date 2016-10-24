//
//  FirstViewController.swift
//  D05
//
//  Created by Erwan SEVENO on 10/10/16.
//  Copyright © 2016 Erwan SEVENO. All rights reserved.
//

import UIKit



class FirstViewController: UIViewController , UITableViewDataSource, UITableViewDelegate{

    var index : Int = 1000
    
    var lieu : [String] = ["42", "limoge", "maison"]
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lieu.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("lieucell") as! lieucell
        cell.lieu = lieu[indexPath.row]
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
            for vcc in (tabBarController?.viewControllers)!
            {
                if let vc = vcc as? SecondViewController
                {
                    vc.index = indexPath.row
                    tabBarController?.selectedIndex = tabBarController!.viewControllers!.indexOf(vc)!
                }
            }
        }
}


