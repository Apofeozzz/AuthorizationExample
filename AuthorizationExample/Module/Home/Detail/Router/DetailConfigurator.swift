//
//  DetailConfigurator.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 5/2/20.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import Foundation

class DetailConfigurator: DetailConfiguratorProtocol {
    
    func configure(with controller: DetailViewController, and item: Item) {
        
        let presenter = DetailPresenter(view: controller, item: item)
        
        let interactor = DetailInteractor(presenter: presenter)
        
        let router = DetailRouter(controller: controller)
        
        controller.presenter = presenter
        
        presenter.interactor = interactor
        
        presenter.router = router
        
    }
    
}
