//
//  CommentBuilder.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 5/4/20.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import UIKit

class CommentBuilder {
    
    func commentController(with dataSource: DataSourceServiceProtocol, and item: Item) -> UIViewController {
        
        let vc = CommentViewController()
        
        let configurator = CommentConfigurator()
        
        configurator.configure(with: vc, dataSource: dataSource, and: item)
        
        return vc
        
    }
    
}
