//
//  LoginRouter.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 4/20/20.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import UIKit

class LoginRouter: LoginRouterProtocol {
    
    // MARK: - CONTROLLER -
    
    weak var controller: UIViewController!
    
    // MARK: - INIT -
    
    required init(controller: UIViewController) {
        
        self.controller = controller
        
    }
    
}
