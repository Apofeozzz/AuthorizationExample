//
//  LaunchRouter.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 4/20/20.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import UIKit

class LaunchRouter: LaunchRouterProtocol {
    
    weak var controller: UIViewController!
    
    required init(controller: UIViewController) {
        
        self.controller = controller
        
    }
    
    
}
