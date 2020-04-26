//
//  SignUpRouter.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 4/25/20.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import UIKit

class SignUpRouter: SignUpRouterProtocol {
    
    // MARK: - DATA SOURCE -
    
    let controller: UIViewController!
    
    // MARK: - INIT -
    
    required init(controller: UIViewController) {
        
        self.controller = controller
        
    }
    
}
