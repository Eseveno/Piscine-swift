//
//  Tweet.swift
//  D04
//
//  Created by Erwan SEVENO on 10/7/16.
//  Copyright © 2016 Erwan SEVENO. All rights reserved.
//

import Foundation


struct Tweet: CustomStringConvertible{
    let name : String?
    let text : String?
    let date : String?
    
    var description: String {
        return "name: \(name), text: \(text)"
    }
}