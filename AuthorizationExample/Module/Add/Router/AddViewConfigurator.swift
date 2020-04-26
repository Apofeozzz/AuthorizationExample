//
//  AddViewConfigurator.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 4/26/20.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import Foundation

class AddViewConfigurator: AddViewConfiguratorProtocol {
    
    func configure(with controller: AddViewController, and view: AddView) {
        
        controller.mainView = view
        
    }
    
}
