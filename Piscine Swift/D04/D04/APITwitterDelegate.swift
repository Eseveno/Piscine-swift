//
//  APITwitterDelegate.swift
//  D04
//
//  Created by Erwan SEVENO on 10/7/16.
//  Copyright © 2016 Erwan SEVENO. All rights reserved.
//

import Foundation


protocol APITwitterDelegate: class {
    func receiveTweet(tweet : [Tweet])
    func errorTweet(error : NSError)
}