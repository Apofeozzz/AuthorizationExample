//
//  DetailBuilder.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 5/2/20.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import UIKit

class DetailBuilder {
    
    func detailController(with dataSource: DataSourceServiceProtocol, and item: Item) -> UIViewController {
        
        let detailVC = DetailViewController()
        
        let configurator: DetailConfiguratorProtocol = DetailConfigurator()
        
        configurator.configure(with: detailVC, dataSource: dataSource, and: item)
        
        return detailVC
        
    }
    
}
