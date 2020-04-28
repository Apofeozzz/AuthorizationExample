//
//  AddBuilder.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 4/26/20.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import UIKit

class AddBuilder {
    
    func addController(dataSource: DataSourceServiceProtocol) -> UIViewController {
        
        let addVC = AddViewController()
        
        let configurator: AddViewConfigurator = AddViewConfigurator()
        
        configurator.configure(with: addVC, dataSource: dataSource)
        
        return addVC
        
    }
    
}
