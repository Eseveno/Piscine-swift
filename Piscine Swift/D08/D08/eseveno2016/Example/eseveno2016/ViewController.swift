//
//  ViewController.swift
//  eseveno2016
//
//  Created by seveno on 10/14/2016.
//  Copyright (c) 2016 seveno. All rights reserved.
//

import UIKit
import eseveno2016

class ViewController: UIViewController {
    
    var AM: ArticleManager?
    var tabarticle: [Article] = []
    var test: [Article] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        AM = ArticleManager()
        test.append(AM!.newArticle("1er Article", Content: "content1", Langue: "fr", Image: "dsadada".dataUsingEncoding(NSUTF8StringEncoding), DDC: dateFormatter.dateFromString("2014-07-15"), DDM: dateFormatter.dateFromString("2014-07-15")))
        test.append(AM!.newArticle("2eme Article", Content: "content2", Langue: "en", Image: "dsadada".dataUsingEncoding(NSUTF8StringEncoding), DDC: dateFormatter.dateFromString("2014-07-15"), DDM: dateFormatter.dateFromString("2014-07-15")))
        
        for elem in test
        {
            print(elem.description)
        }
        AM?.save()
        AM!.removeArticle(test.first!)
        test.removeAtIndex(test.startIndex)
        print("--------------------------------------------------------------------------")
        AM?.save()
        tabarticle = AM!.getAllArticles()
        for elem in tabarticle
        {
            print(elem.description)
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}