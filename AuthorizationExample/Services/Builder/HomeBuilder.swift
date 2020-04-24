//
//  HomeBuilder.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 4/24/20.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import UIKit

class HomeBuilder {
    
    func homeController() -> UIViewController {
        
        let homeVC = HomeViewController()
        
        let configurator: HomeConfiguratorProtocol = HomeConfigurator()
        configurator.configure(with: homeVC)
        
        let navigationController = UINavigationController(rootViewController: homeVC)
        navigationController.modalPresentationStyle = .fullScreen
        
        return navigationController
        
    }
    
}
