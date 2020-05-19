//
//  Vine.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 4/27/20.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import UIKit

struct Item {
    
    var image: UIImage

    var review: [String]
    
    var title: String
    
    var rate: Int
    
    var category: Category
    
    var subcategory: String
    
}

enum Category: String, Codable {
    
    case Alcohol
    
    case Other
    
}
