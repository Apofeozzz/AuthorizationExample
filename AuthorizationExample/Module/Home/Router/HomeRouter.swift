//
//  HomeRouter.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 4/24/20.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import UIKit

class HomeRouter: HomeRouterProtocol {
    
    weak var controller: UIViewController!
    
    required init(controller: UIViewController) {
        
        self.controller = controller
        
    }
    
}
