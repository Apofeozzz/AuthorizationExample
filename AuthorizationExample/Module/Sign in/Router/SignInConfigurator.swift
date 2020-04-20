//
//  SignInConfigurator.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 4/20/20.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import Foundation

class SignInConfigurator: SignInConfiguratorProtocol {
    
    func configure(with controller: SignInViewController) {
        
        let presenter = SignInPresenter(view: controller)
        
        let interactore = SignInInteractor(presenter: presenter)
        
        let router = SignInRouter(controller: controller)
        
        controller.presenter = presenter
        
        presenter.interactor = interactore
        
        presenter.router = router
        
    }
    
}
