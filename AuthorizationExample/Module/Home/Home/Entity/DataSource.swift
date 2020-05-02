//
//  DataSource.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 4/27/20.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import Foundation
import UIKit

class DataSource {
    
    var items = [Item]()
    
    init() {
        
        CoreDataManager.shared.fetchInBackgroundContext {[weak self] (vineEntities) in
            
            guard let ss = self else { return }
            
            for entity in vineEntities {
                
                guard let image = UIImage(data: entity.image!)
                    
                    else {
                        
                        assertionFailure("Can't create image")
                        
                        return
                        
                }
                
                guard let entityReview = entity.review else { return }
                
                if let reviews = try? JSONDecoder().decode([String].self, from: entityReview) {
                    
                    let item = Item(image:      image,
                                    review:     reviews,
                                    title:      entity.title!,
                                    rate:       Int(entity.rate),
                                    category:   .Alcohol,
                                    subcategory: "Vine")
                    
                    ss.items.append(item)
                    
                }
                
            }
            
        }
        
    }
    
}
