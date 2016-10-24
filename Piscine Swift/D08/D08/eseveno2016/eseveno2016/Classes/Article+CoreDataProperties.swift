//
//  Article+CoreDataProperties.swift
//  Pods
//
//  Created by Erwan SEVENO on 10/14/16.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Article {

    @NSManaged var content: String?
    @NSManaged var date_de_creation: NSDate?
    @NSManaged var date_de_modification: NSDate?
    @NSManaged var image: NSData?
    @NSManaged var titre: String?
    @NSManaged var langue: String?
    
    override public var description : String{
        return "titre : \(titre)\n content : \(content)\n langue : \(langue)\n creation : \(date_de_creation)\n modif : \(date_de_modification)\n image: \(image)"
    }

}
