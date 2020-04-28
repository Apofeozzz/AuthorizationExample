//
//  HomeConfigurator.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 4/24/20.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import Foundation

class HomeConfigurator: HomeConfiguratorProtocol {
    
    func configure(with controller: HomeViewController) {
        
        let presenter = HomePresenter(view: controller)
        
        let dataSourceService = DataSourceService()
        
        let interactor = HomeInteractor(presenter: presenter, dataSource: dataSourceService)
        
        let router = HomeRouter(controller: controller)
        
//        interactor.dataSource = DataSource.shared
        
        controller.presenter = presenter
        
        presenter.interactor = interactor
        
        presenter.router = router
        
    }
    
}
