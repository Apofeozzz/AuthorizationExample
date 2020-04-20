//
//  LoginConfigurator.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 4/20/20.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import Foundation

class LoginConfigurator: LoginConfiguratorProtocol {
    
    func configure(with controller: LoginViewController) {
        
        let presenter = LoginPresenter(view: controller)
        
        let interactor = LoginInteractor(presenter: presenter)
        
        let router = LoginRouter(controller: controller)
        
        controller.presenter = presenter
        
        presenter.interactor = interactor
        
        presenter.router = router
        
    }
    
}
