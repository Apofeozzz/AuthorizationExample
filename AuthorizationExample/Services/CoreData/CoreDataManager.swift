//
//  CoreDataManager.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 4/29/20.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class CoreDataManager {
    
    static let shared = CoreDataManager()
    
    // MARK: - ENTITY DESCRIPTION -
    
    func entityForName(entityName: String) -> NSEntityDescription {
        
        guard let entity = NSEntityDescription.entity(forEntityName: entityName,
                                                      in: persistentContainer.viewContext)
            else { fatalError("Can't create new entity") }
        
        return entity
        
    }
    
    // MARK: - DELETE OBJECT -
    
    func delete(_ object: NSManagedObject) {
        
        persistentContainer.viewContext.delete(object)
        
        saveContext()
        
    }
    
    // MARK: - FETCH DATA -
    
    func fetchInBackgroundContext(completion: @escaping (_ vine: [ItemEntity]) -> ()) {
        
        let backgroundContext = persistentContainer.newBackgroundContext()
        
        let fetchRequest = NSFetchRequest<ItemEntity>(entityName: "ItemEntity")
        
        let asynchFetchRequest = NSAsynchronousFetchRequest(fetchRequest: fetchRequest) { (fetchResult) in
            
            guard let vineEntities = fetchResult.finalResult else { return }
            
            completion(vineEntities)
            
        }
        
        do {
            
            try backgroundContext.execute(asynchFetchRequest)
            
        } catch let err {
        
            assertionFailure(err.localizedDescription)
            
        }
        
    }
    
    // MARK: - SAVE -
    
    func saveInBackground(_ vine: Item) {
        
        persistentContainer.performBackgroundTask { (context) in
            
            let vineEntity = ItemEntity(context: context)
            
            vineEntity.title = vine.title
            
            vineEntity.review = vine.review
            
            vineEntity.rate = Int16(vine.rate)
            
            let imageData = vine.image.jpegData(compressionQuality: 1)
                
            vineEntity.image = imageData
            
            do {
                try context.save()
            } catch {
                assertionFailure(error.localizedDescription)
            }

        }
        
    }
    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "AuthorizationExample")
        
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            
            if let error = error as NSError? {
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
                
            }
            
        })
        
        return container
        
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        
        let context = persistentContainer.viewContext
        
        if context.hasChanges {
            
            do {
                
                try context.save()
                
            } catch {
                
                let nserror = error as NSError
                
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
                
            }
            
        }
        
    }
    
}
