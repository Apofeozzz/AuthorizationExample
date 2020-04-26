//
//  SignUpConfigurator.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 4/25/20.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import Foundation

class SignUpConfigurator: SignUpConfiguratorProtocol {
    
    func configure(with controller: SignUpViewController) {
        
        let presenter = SignUpPresenter(view: controller)
        
        let interactor = SignUpInteractor(presenter: presenter)
        
        let router = SignUpRouter(controller: controller)
        
        controller.presenter = presenter
        
        presenter.interactor = interactor
        
        presenter.router = router
        
    }
    
}
