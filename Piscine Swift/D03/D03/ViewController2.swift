//
//  ViewController2.swift
//  D03
//
//  Created by Erwan SEVENO on 10/7/16.
//  Copyright © 2016 Erwan SEVENO. All rights reserved.
//

import UIKit

    class ViewController2: UIViewController  , UIScrollViewDelegate {
    
    var test : UIImageView?
    var image : UIImage?
    var imageInit: CGFloat = 0.0
    
        @IBOutlet weak var scroll: UIScrollView!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scroll.addSubview(test!)
        scroll.contentSize = (test?.frame.size)!
        scroll.maximumZoomScale = 100
        scroll.minimumZoomScale = UIScreen.mainScreen().bounds.width / (test?.frame.size.width)!
        scroll.setZoomScale(scroll.minimumZoomScale, animated: false)
    }
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return test
        }
}