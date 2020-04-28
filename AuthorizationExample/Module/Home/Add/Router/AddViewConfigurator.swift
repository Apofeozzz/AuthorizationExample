//
//  AddViewConfigurator.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 4/26/20.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import Foundation

class AddViewConfigurator: AddViewConfiguratorProtocol {
    
    func configure(with controller: AddViewController,
                   dataSource: DataSourceServiceProtocol) {
        
        let presenter = AddViewPresenter(view: controller)
        
        let interactor = AddViewInteractor(presenter: presenter,
                                           dataSource: dataSource)
        
        let router = AddViewRouter(controller: controller)
        
        controller.presenter = presenter
        
        presenter.interactor = interactor
        
        presenter.router = router
        
    }
    
    deinit {
        print("AddViewConfigurator deinit")
    }
    
}
