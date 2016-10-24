//
//  APIController.swift
//  D04
//
//  Created by Erwan SEVENO on 10/7/16.
//  Copyright © 2016 Erwan SEVENO. All rights reserved.
//

import Foundation

class APIController
{
    weak var delegate : APITwitterDelegate?
    let token : String
    
    init(delegate : APITwitterDelegate?, token: String)
    {
        self.delegate = delegate
        self.token = token
    }
    
    func getTweet(search : String)
    {
       
        let parameters = "q=\(search.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!)&count=100&lang=fr"
        let url = NSURL(string : "https://api.twitter.com/1.1/search/tweets.json?\(parameters)")
        let request = NSMutableURLRequest(URL:url!)
        request.HTTPMethod = "GET"
        request.setValue("application/x-www-form-urlencoded;charset=UTF-8", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request)
        {
            (data, response, error) in
            if let err = error {
                print("error")
                print(err)
            }
            else if let d = data {
                do {
                    if let dic : NSDictionary = try NSJSONSerialization.JSONObjectWithData(d, options: NSJSONReadingOptions.MutableContainers) as? NSDictionary {
                        dispatch_async(dispatch_get_main_queue(),
                                       {
                                        var tab_tweets : [Tweet] = []
                                        if let statuses = dic["statuses"] as? [[String : AnyObject]] {
                                            for status in statuses {
                                                if let name = status["user"]?["name"] as? String, text = status["text"] as? String , date = status["created_at"] as? String{
                                                    let dateFormatter = NSDateFormatter()
                                                    dateFormatter.dateFormat = "E, MMM dd HH:mm:ss Z yyyy"
                                                    let datef = dateFormatter.dateFromString(date)
                                                    dateFormatter.dateFormat = "dd/MM/yy HH:mm"
                                                    let dates = dateFormatter.stringFromDate(datef!)
                                                    tab_tweets.append(Tweet (name: name, text: text, date: dates))
                                                }
                                            }
                                            self.delegate!.receiveTweet(tab_tweets)
                                        }
                        })
                        
                    }
                }
                catch (let err) {
                    print(err)
                }
            }
        }
        task.resume()
        /*{
         
         dispatch_async(dispatch_get_main_queue() {
         delegate?.receiveTweet(<#T##tweet: [Tweet]##[Tweet]#>)
         }
         }*/
    }
    
    
}