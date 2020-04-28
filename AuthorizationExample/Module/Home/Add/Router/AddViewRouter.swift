//
//  AddViewRouter.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 4/26/20.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import UIKit

class AddViewRouter: AddViewRouterProtocol {
    
    // MARK: - DATA SOURCE -
    
    weak var controller: UIViewController!
    
    // MARK: - INIT -
    
    required init(controller: UIViewController) {
        
        self.controller = controller
        
    }
    
    deinit {
        print("AddViewRouter deinit")
    }
    
}
