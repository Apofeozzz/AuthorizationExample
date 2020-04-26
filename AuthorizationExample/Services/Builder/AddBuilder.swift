//
//  AddBuilder.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 4/26/20.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import UIKit

class AddBuilder {
    
    func addController() -> UIViewController {
        
        let view = AddView()
        
        let addVC = AddViewController()
        
        let configurator: AddViewConfigurator = AddViewConfigurator()
        
        configurator.configure(with: addVC, and: view)
        
        return addVC
        
    }
    
}
