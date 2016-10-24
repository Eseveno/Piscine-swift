//
//  ViewController.swift
//  D06
//
//  Created by Erwan SEVENO on 10/11/16.
//  Copyright © 2016 Erwan SEVENO. All rights reserved.
//

import UIKit

class Shape: UIView {
    
    var gravity : UIGravityBehavior!
    var dynamicAnimator : UIDynamicAnimator!
    var view : UIView!
    
    init(x : CGFloat, y : CGFloat, gravity : UIGravityBehavior, view : UIView, dynamicAnimator : UIDynamicAnimator)
    {
        super.init(frame : CGRectMake(x - 50, y - 50, 100, 100))
        self.gravity = gravity
        self.view = view
        self.dynamicAnimator = dynamicAnimator
        self.backgroundColor = generateRandomColor()
        if (arc4random() % 2 == 0)
        {
            self.layer.cornerRadius = 50
        }
        initGestureRecognizers()
    }
    
    func initGestureRecognizers() {
        let panGR = UIPanGestureRecognizer(target: self, action: #selector(Shape.didPan(_:)))
        addGestureRecognizer(panGR)
    }
    
    override var collisionBoundsType: UIDynamicItemCollisionBoundsType {
        if self.layer.cornerRadius == 50 {
            return .Ellipse
        }
        return .Rectangle
    }
    
    func didPan(gesture: UIPanGestureRecognizer) {
        switch gesture.state {
        case .Began:
            print("began")
            gravity.removeItem(self)
        case .Changed :
            self.center = gesture.locationInView(superview)
            dynamicAnimator.updateItemUsingCurrentState(self)
        case .Ended :
            print("ended")
            view.addSubview(self)
            gravity.addItem(self)
        case .Failed, .Cancelled :
            print("failed or cancelled")
        case .Possible :
            print("possible")
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func generateRandomColor() -> UIColor {
        let hue : CGFloat = CGFloat(arc4random() % 256) / 256
        let saturation : CGFloat = CGFloat(arc4random() % 128) / 256 + 0.5
        let brightness : CGFloat = CGFloat(arc4random() % 128) / 256 + 0.5
        return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1)
    }
}

class ViewController: UIViewController {
    
    var dynamicAnimator : UIDynamicAnimator!
    var gravityBehavior : UIGravityBehavior!
    var colliderBehavior : UICollisionBehavior!
    var elasticityBehavior : UIDynamicItemBehavior!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //let gesture = UIPanGestureRecognizer(target : self, action : #selector(panGesture(_:)))
        //view.addGestureRecognizer(gesture)
        
        dynamicAnimator = UIDynamicAnimator(referenceView: view)
        
        gravityBehavior = UIGravityBehavior()
        gravityBehavior.magnitude = 1.5
        
        colliderBehavior = UICollisionBehavior()
        colliderBehavior.translatesReferenceBoundsIntoBoundary = true
        
        elasticityBehavior = UIDynamicItemBehavior()
        elasticityBehavior.elasticity = 0.5
        
        dynamicAnimator.addBehavior(gravityBehavior)
        dynamicAnimator.addBehavior(colliderBehavior)
        dynamicAnimator.addBehavior(elasticityBehavior)
    }
    
    
    
    
    
    @IBAction func tapAction(sender: UITapGestureRecognizer) {
        
        
        addShape(sender)
    }
    
    func addShape(sender : UIGestureRecognizer)
    {
        let myView = Shape(x: sender.locationInView(view).x, y: sender.locationInView(view).y, gravity : gravityBehavior, view : view, dynamicAnimator : dynamicAnimator)
        self.view.addSubview(myView)
        gravityBehavior.addItem(myView)
        colliderBehavior.addItem(myView)
        elasticityBehavior.addItem(myView)
    }
}