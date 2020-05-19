//
//  LaunchRouter.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 4/20/20.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import UIKit

class LaunchRouter: LaunchRouterProtocol {
    
    // MARK: - CONTROLLER -
    
    weak var controller: UIViewController!
    
    // MARK: - INIT -
    
    required init(controller: UIViewController) {
        
        self.controller = controller
        
    }
    
    // MARK: - NAVIGATION -
    
    func showSignInController() {
        
        let signIn = Builder.loginBuilder().signInController()
        
        presentController(signIn)
        
    }
    
    func showHomeController() {
        
        let home = Builder.homeBuilder().homeController()
        
        presentController(home)
        
    }
    
}
