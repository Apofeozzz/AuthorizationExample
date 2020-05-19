//
//  HomeRouter.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 4/24/20.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import UIKit

class HomeRouter: HomeRouterProtocol {
    
    // MARK: - DATA SOURCE -
    
    weak var controller: UIViewController!
    
    // MARK: - INIT -
    
    required init(controller: UIViewController) {
        
        self.controller = controller
        
    }
    
    // MARK: - NAVIGATION -
    
    func showAddController(dataSource: DataSourceServiceProtocol) {
        
        let addVC = Builder.addBuilder().addController(dataSource: dataSource)
        
        pushController(addVC)
        
    }
    
    func showDetailController(with dataSource: DataSourceServiceProtocol, and item: Item) {
        
        let detailVC = Builder
            .detailBuilder()
            .detailController(with: dataSource,
                              and: item)
        
        pushController(detailVC)
        
    }
    
}
