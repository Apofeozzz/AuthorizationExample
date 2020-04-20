//
//  LaunchConfigurator.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 4/20/20.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import Foundation

class LaunchConfigurator: LaunchConfiguratorProtocol {
    
    func configure(with controller: LaunchViewController) {
        
        let presenter = LaunchViewPresenter(view: controller)
        
        let interactor = LaunchInteractor(presenter: presenter)
        
        let router = LaunchRouter(controller: controller)
        
        controller.presenter = presenter
        
        presenter.interactor = interactor
        
        presenter.router = router
    }
    
}
