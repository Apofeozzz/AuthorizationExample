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
    
    var items = [Vine]()
    
    init() {
        
        CoreDataManager.shared.fetchInBackgroundContext {[weak self] (vineEntities) in
            
            guard let ss = self else { return }
            
            for entity in vineEntities {
                
                guard let image = UIImage(data: entity.image!)
                    
                    else {
                        
                        assertionFailure("Can't create image")
                        
                        return
                }
                
                let vine = Vine(image: image,
                                review: entity.review!,
                                title: entity.title!,
                                rate: Int(entity.rate))
                
                ss.items.append(vine)
                
            }
            
        }
        
    }
    
}
