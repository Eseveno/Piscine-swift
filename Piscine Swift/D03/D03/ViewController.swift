//
//  ViewController.swift
//  D03
//
//  Created by Erwan SEVENO on 10/6/16.
//  Copyright © 2016 Erwan SEVENO. All rights reserved.
//

import UIKit



    class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
        
        
        @IBOutlet weak var collect : UICollectionView!
        
        let reuseIdentifier = "cell"
        var urls = ["https://upload.wikimedia.org/wikipedia/commons/0/0e/WISE-_Andromeda.jpg",
                    "https://upload.wikimedia.org/wikipedia/commons/7/75/Bi-crystal.jpg",
                    "https://upload.wikimedia.org/wikipedia/commons/b/b4/The_Sun_by_the_Atmospheric_Imaging_Assembly_of_NASA's_Solar_Dynamics_Observatory_-_20100819.jpg",
                    "https://upload.wikimedia.org/wikipedia/commons/d/d5/WISE_full_sky.jpg"]
        
        var imageView : UIImageView?
        var image : UIImage?
        var i : Int = 0
        
        func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
        {
            return self.urls.count
        }
        
        
        
        
        
        func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
        {
            
            _ = (UIApplication.sharedApplication().delegate as! AppDelegate).setNetworkActivityIndicatorVisible(true)
            let url = NSURL(string: urls[indexPath.item])
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! MyCollectionViewCell
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0))
            {
                let data = NSData(contentsOfURL: url!)
                if data != nil
                {
                    dispatch_async(dispatch_get_main_queue(),
                    {
                    cell.activity.stopAnimating()
                    cell.imageview.image = UIImage(data: (data)!)
                    _ = (UIApplication.sharedApplication().delegate as! AppDelegate).setNetworkActivityIndicatorVisible(false)
                    });
                }
                else{
                    dispatch_async(dispatch_get_main_queue(),
                    {
                        cell.activity.stopAnimating()
                        (UIApplication.sharedApplication().delegate as! AppDelegate).setNetworkActivityIndicatorVisible(false)
                    let refreshAlert = UIAlertController(title: "Error", message: "Cannot acces to" + self.urls[indexPath.item], preferredStyle: UIAlertControllerStyle.Alert)
                        refreshAlert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { (action: UIAlertAction!) in
                        }))
                        self.presentViewController(refreshAlert, animated: true, completion: nil)
                    });
                }
            /*cell.backgroundColor = UIColor.blueColor()*/

            }
        return cell
        }
        
        override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
            if (segue.identifier == "segueIdentifier")
            {
                if let indexPath = collect?.indexPathForCell(sender as! UICollectionViewCell) {
                    let controller = segue.destinationViewController as! ViewController2
                    let url = NSURL(string: urls[indexPath.item])
                    let data = NSData(contentsOfURL: url!)
                    let imv = UIImageView(image: UIImage(data: (data)!))
                    controller.test = imv
                    controller.image = UIImage(data: (data)!)
                    print(url)
                    
                }
            }
        }
        
        
        
}
