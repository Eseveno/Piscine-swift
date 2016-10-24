//
//  ViewController.swift
//  D04
//
//  Created by Erwan SEVENO on 10/7/16.
//  Copyright © 2016 Erwan SEVENO. All rights reserved.
//

import UIKit



class ViewController: UIViewController, APITwitterDelegate, UITableViewDelegate, UITableViewDataSource {
    
    var tab_tweet : [Tweet] = []
    
    @IBOutlet weak var tableView: UITableView!{
    didSet {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 150
        tableView.rowHeight = UITableViewAutomaticDimension

        }
    }
    
    var API : APIController?
    var Tweets: [Tweet]?
    var token : String?
        {
        didSet{
            API = APIController(delegate : self, token: token!)
            API!.getTweet("ecole 42")
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(tab_tweet.count)
        return tab_tweet.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("celltweet") as! TableViewCell
        cell.tweet = tab_tweet[indexPath.row]
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (token == nil)
        {
            getToken()
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func receiveTweet(tweet: [Tweet]) {
        tab_tweet = tweet
        tableView.reloadData()
    }
    
    func errorTweet(error: NSError) {
        let refreshAlert = UIAlertController(title: "Error", message: error.debugDescription, preferredStyle: UIAlertControllerStyle.Alert)
        
        refreshAlert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { (action: UIAlertAction!) in
        }))
        self.presentViewController(refreshAlert, animated: true, completion: nil)
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        API?.getTweet(textField.text!)
        view.endEditing(true)
        return true
    }
    
    
    
    func getToken()
    {
        let CUSTOMER_KEY = "q1TGrQSCmAjVqq1VkvrrqZyIG"
        let CUSTOMER_SECRET = "eDNAMaL2vi66rQIlGYbcDSMphWxCCxzJk9Cq3waCx4WJwB3wsU"
        let BEARER = ((CUSTOMER_KEY + ":" + CUSTOMER_SECRET).dataUsingEncoding(NSUTF8StringEncoding))!.base64EncodedStringWithOptions(NSDataBase64EncodingOptions(rawValue: 0))
        let url = NSURL(string : "https://api.twitter.com/oauth2/token")
        let request = NSMutableURLRequest(URL:url!)
        request.HTTPMethod = "POST"
        request.setValue("Basic " + BEARER, forHTTPHeaderField: "Authorization")
        request.setValue("application/x-www-form-urlencoded;charset=UTF-8", forHTTPHeaderField: "Content-Type")
        request.HTTPBody = "grant_type=client_credentials".dataUsingEncoding(NSUTF8StringEncoding)
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request)
        {
            (data, response, error) in
            if let err = error{
                print("error")
                self.errorTweet(err)
            }
            else if let d = data {
                do {
                    if let dic : NSDictionary = try NSJSONSerialization.JSONObjectWithData(d, options: NSJSONReadingOptions.MutableContainers) as? NSDictionary {
                        dispatch_async(dispatch_get_main_queue(),
                                       {
                                        if let token = dic["access_token"]! as? String
                                        {
                                            self.token = token
                                        }
                        })
                        
                    }
                }
                catch (let err as NSError) {
                    self.errorTweet(err)
                }
            }
        }
        task.resume()
    }
    
}




