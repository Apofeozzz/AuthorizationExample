//
//  DataSourceService.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 4/28/20.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import Foundation

class DataSourceService: DataSourceServiceProtocol {
    
    var data = DataSource()
    
    func returnData() -> [Item] {
        
        data.items
        
    }
    
    func appendNewItem(_ item: Item) {
        
        data.items.append(item)
        
        saveInCoreData(item)
        
    }
    
    func saveInCoreData(_ item: Item) {
        
        CoreDataManager.shared.saveInBackground(item)
        
    }
    
    func saveReview(in item: Item, completion: @escaping () -> Void) {
        
        if let index = data.items.firstIndex(where: { $0.title == item.title }) {
            
            data.items.remove(at: index)
            
            data.items.insert(item, at: index)
            
        }
        
        CoreDataManager.shared.fetchInBackgroundContext { (entities, context) in
            
            if let match = entities.first(where: { $0.title == item.title } ) {
                
                let reviews = try? JSONEncoder().encode(item.review)
                
                match.review = reviews
                
                do {
                    
                    try context.save()
                    
                    completion()
                    
                } catch let err { assertionFailure(err.localizedDescription) }
                
            }
            
        }
        
    }
    
}
