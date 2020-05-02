//
//  DetailRouter.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 5/2/20.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import UIKit

class DetailRouter: DetailRouterProtocol {
    
    weak var controller: UIViewController!
    
    required init(controller: UIViewController) {
        
        self.controller = controller
        
    }
    
}
