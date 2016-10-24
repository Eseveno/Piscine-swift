//
//  ViewController.swift
//  ex02
//
//  Created by Erwan SEVENO on 10/3/16.
//  Copyright © 2016 Erwan SEVENO. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func lol(){}
    func test(a: Float) -> Float
    {
        if a == 0
        {
            b = 0
            last = 0
            lastop = 0
            lab.text = "NaN"
            return 0
        }
        if a == 1
        {
            return 1
        }
        return 1
    }
    
    var b: Float = 0
    var a: Float = 0
    var last: Float = 0
    var lastop: Float = 0;

    @IBAction func b1(sender: UIButton) {
        if last == 12
        {
            b = 0
            a = 0
            last = 0
            lastop = 0
        }
        print("1")
        a = a * 10 + 1
        lab.text = String(a)
        last = 1
        
    }

    @IBAction func b2(sender: UIButton) {
        if last == 12
        {
            b = 0
            a = 0
            last = 0
            lastop = 0
        }
        print("2")
        a = a * 10 + 2
        lab.text = String(a)
        last = 2
        
    }
    @IBAction func b3(sender: UIButton) {
        if last == 12
        {
            b = 0
            a = 0
            last = 0
            lastop = 0
        }
        print("3")
        a = a * 10 + 3
        lab.text = String(a)
        last = 3
        
    }
    
    @IBAction func b4(sender: UIButton) {
        if last == 12
        {
            b = 0
            a = 0
            last = 0
            lastop = 0
        }
        print("4")
        a = a * 10 + 4
        lab.text = String(a)
        last = 4
    }
    
    @IBAction func b5(sender: UIButton) {
        if last == 12
        {
            b = 0
            a = 0
            last = 0
            lastop = 0
        }
        print("5")
        a = a * 10 + 5
        lab.text = String(a)
        last = 5
    }
    
    @IBAction func b6(sender: UIButton) {
        if last == 12
        {
            b = 0
            a = 0
            last = 0
            lastop = 0
        }
        print("6")
        a = a * 10 + 6
        lab.text = String(a)
        last = 6
    }
    
    @IBAction func b7(sender: UIButton) {
        if last == 12
        {
            b = 0
            a = 0
            last = 0
            lastop = 0
        }
        print("7")
        a = a * 10 + 7
        lab.text = String(a)
        last = 7
    }
    
    @IBAction func b8(sender: UIButton) {
        if last == 12
        {
            b = 0
            a = 0
            last = 0
            lastop = 0
        }
        print("8")
        a = a * 10 + 8
        lab.text = String(a)
        last = 8
    }
    
    
    @IBAction func b9(sender: UIButton) {
        if last == 12
        {
            b = 0
            a = 0
            last = 0
            lastop = 0
        }
        print("9")
        a = a * 10 + 9
        lab.text = String(a)
        last = 9
    }
    
    
    
    @IBAction func b0(sender: UIButton) {
        if a == 12
        {
            b = 0
            a = 0
            last = 0
            lastop = 0
        }
        print("0")
        a = a * 10 + 0
        lab.text = String(a)
        last = 0
    }
    
    
    
    @IBAction func bac(sender: UIButton) {
        a = 0
        last = 0
        b = 0
        lastop = 0;
        lab.text = String(a)
        print("ac")
    }
    
    
    @IBAction func bneg(sender: UIButton) {
        if a == 0 && b != 0
        {
            a = b
            b = 0
        }
        a = -a
        b = 0
        last = 12
        lastop = 0
        lab.text = String(a)
        print("neg")
    }
    
    
    @IBAction func badd(sender: UIButton) {
        if last < 11 || last == 12
        {
            if lastop == 1
            {
                a = b + a
            }
            if lastop == 2
            {
                a = b * a
            }
            if lastop == 3
            {
                a = b - a
            }
            if lastop == 4
            {
                if test(a) == 0
                {
                    return
                }
                a = b / a
            }
        
        b = a
        a = 0
        }
        lab.text = String(b)
        last = 13
        lastop = 1
        print("+")
    }
    
    @IBAction func bx(sender: UIButton) {
        
        if last < 11 || last == 12
        {
            if lastop == 1
            {
                a = b + a
            }
            if lastop == 2
            {
                a = b * a
            }
            if lastop == 3
            {
                a = b - a
            }
            if lastop == 4
            {
                if test(a) == 0
                {
                    return
                }
                a = b / a
            }
            
            b = a
            a = 0
        }
        lab.text = String(b)
        last = 14
        lastop = 2
        print("*")
    }
    
    
    @IBAction func bm(sender: UIButton) {
        if last < 11 || last == 12
        {
            if lastop == 1
            {
                a = b + a
            }
            if lastop == 2
            {
                a = b * a
            }
            if lastop == 3
            {
                a = b - a
            }
            if lastop == 4
            {
                if test(a) == 0
                {
                    return
                }
                a = b / a
            }
        
        b = a
        a = 0
        }
        lab.text = String(b)
        last = 15
        lastop = 3
        print("-")
    }
    
    @IBAction func bd(sender: UIButton) {
        
        if last < 11 || last == 12
        {
            if lastop == 1
            {
                a = b + a
            }
            if lastop == 2
            {
                a = b * a
            }
            if lastop == 3
            {
                a = b - a
            }
            if lastop == 4
            {
                if test(a) == 0
                {
                    return
                }
                a = b / a
            }
            
            b = a
            a = 0
        }
        lab.text = String(b)
        last = 16
        lastop = 4
        print("/")
    }
   
    @IBAction func be(sender: UIButton) {
        
        if lastop == 1
        {
            a = b + a
        }
        if lastop == 2
        {
            a = b * a
        }
        if lastop == 3
        {
            a = b - a
        }
        if lastop == 4
        {
            if test(a) == 0
            {
                return
            }
            a = b / a
        }
            
        b = a
        a = 0
        last = 16
        lastop = 0
        lab.text = String(b)
        print("=")
    }
    
    @IBOutlet weak var lab: UILabel!

}

