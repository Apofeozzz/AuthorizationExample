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
    
    func returnData() -> [Vine] {
        
        data.items
        
    }
    
    func appendNewItem(_ item: Vine) {
        
        data.items.append(item)
        
        saveInCoreData(item)
        
    }
    
    func saveInCoreData(_ item: Vine) {
        
        CoreDataManager.shared.saveInBackground(item)
        
    }
    
}
