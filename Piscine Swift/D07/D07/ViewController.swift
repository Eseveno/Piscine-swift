//
//  ViewController.swift
//  D07
//
//  Created by Erwan SEVENO on 10/12/16.
//  Copyright © 2016 Erwan SEVENO. All rights reserved.
//

import UIKit
import ForecastIO
import RecastAI

class ViewController: UIViewController, HandlerRecastRequestProtocol {

    var bot : RecastAIClient?
    var client : APIClient?
    var flag : Bool = true
    
    
    @IBOutlet weak var SearchBar: UITextField!
    
    @IBOutlet weak var Label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.client = APIClient(apiKey: "e26a756506c5dbc3fbd2e54ef9d263c4")
        client?.units = .UK
        client?.language = .French
        //Initialise bot with token & handlerRecastProtocol
        self.bot = RecastAIClient(token : "d050ff6a0044a40ad6fb3eb2d76705bc", handlerRecastRequestProtocol: self)
        // Do any additional setup after loading the view, typically from a nib.
        self.bot?.textRequest("")
        Label.text = ""
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func SendButton(sender: AnyObject) {
        self.bot?.textRequest(SearchBar.text!)
    }
    
    func recastRequestDone(response : Response)
    {
            if (response.intents != nil)
            {
              if (response.intents!.first != nil)
              {
                if let lat = response.sentences?[0].entities?.locations?[0].lat, lng = response.sentences?[0].entities?.locations?[0].lng{
                    self.client!.getForecast(latitude: Double(lat), longitude: Double(lng)){ (data, err) in
                        if ((err) != nil) {  }
                        else {
                            print(data?.daily?.summary)
                            dispatch_async(dispatch_get_main_queue()){
                                self.Label.text = data?.daily?.summary!
                            }
                        }
                    }
                }
            }
            else
            {
                Label.text = "Error"
            }
        }
    }
    
    func recastRequestError(error : NSError)
    {
        if (!flag)
        {
            Label.text = "Error"
        }
        else
        {
            flag = false
        }
    }
}

