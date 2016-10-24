//
//  ArticleManager.swift
//  Pods
//
//  Created by Erwan SEVENO on 10/14/16.
//
//


import UIKit
import CoreData

public class ArticleManager{
    
    public var managedObjectContext: NSManagedObjectContext
    
    var bundle: NSBundle
    var mom: NSManagedObjectModel
    
    public init() {
        bundle = NSBundle(forClass: Article.self)
        let url = bundle.URLForResource("article", withExtension: "momd")!
        mom = NSManagedObjectModel(contentsOfURL: url)!
        let psc = NSPersistentStoreCoordinator(managedObjectModel: mom)
        managedObjectContext = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = psc
        
        let urls = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        let docURL = urls[urls.endIndex-1]
        let storeURL = docURL.URLByAppendingPathComponent("article.xcdatamodeld")
        do {
            try psc.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: storeURL, options: nil)
        } catch {
            print("Error migrating store: \(error)")
        }
    }
    
    public func newArticle(Titre: String?, Content: String?, Langue: String?, Image: NSData?, DDC: NSDate?, DDM: NSDate?) -> Article
    {
        let entity =  NSEntityDescription.entityForName("Article", inManagedObjectContext:managedObjectContext)
        let article = NSManagedObject(entity: entity!,insertIntoManagedObjectContext: managedObjectContext)
        article.setValue(Titre, forKey: "titre")
        article.setValue(Content, forKey: "content")
        article.setValue(Langue, forKey: "langue")
        article.setValue(Image, forKey: "image")
        article.setValue(DDC, forKey: "date_de_creation")
        article.setValue(DDM, forKey: "date_de_modification")
        
        return article as! Article
    }
    
    public func getAllArticles() -> [Article]
    {
        let fetchRequest = NSFetchRequest()
        
        // Create Entity Description
        let entityDescription = NSEntityDescription.entityForName("Article", inManagedObjectContext: self.managedObjectContext)
        
        // Configure Fetch Request
        fetchRequest.entity = entityDescription
        
        do {
            let result = try self.managedObjectContext.executeFetchRequest(fetchRequest)
            return (result as? [Article])!
            
        } catch {
            let fetchError = error as NSError
            return []
        }
    }
    
    public func getArticles(withLang lang : String) -> [Article]
    {
        let fetchRequest = NSFetchRequest(entityName: "Article")
        
        // Create Predicate
        let predicate = NSPredicate(format: "%K == %@", "langue", lang)
        fetchRequest.predicate = predicate
        
        // Execute Fetch Request
        do {
            let result = try self.managedObjectContext.executeFetchRequest(fetchRequest)
            return (result as? [Article])!
            
        } catch {
            let fetchError = error as NSError
            return []
        }
    }
    
    public func getArticles(containString str : String) -> [Article]
    {
        let fetchRequest = NSFetchRequest(entityName: "Article")
        
        // Create Predicate
        let predicate = NSPredicate(format: "content CONTAINS %@ OR titre CONTAINS %@", str)
        fetchRequest.predicate = predicate
        
        // Execute Fetch Request
        do {
            let result = try self.managedObjectContext.executeFetchRequest(fetchRequest)
            return (result as? [Article])!
            
        } catch {
            let fetchError = error as NSError
            return []
        }
        
    }
    
    public func removeArticle(article : Article)
    {
        managedObjectContext.deleteObject(article)
    }
    
    public func save()
    {
        do {
            try managedObjectContext.save()
        }
        catch {
            print("Error save()")
        }
    }
}
