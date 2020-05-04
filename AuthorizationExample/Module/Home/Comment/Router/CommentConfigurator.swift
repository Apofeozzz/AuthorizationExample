//
//  CommentConfigurator.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 5/4/20.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import Foundation

class CommentConfigurator: CommentConfiguratorProtocol {
    
    func configure(with controller: CommentViewController,
                   dataSource: DataSourceServiceProtocol,
                   and item: Item) {
        
        let presenter = CommentPresenter(view: controller)
        
        controller.presenter = presenter
        
        let interactor = CommentInteractor(presenter: presenter,
                                           dataSource: dataSource,
                                           item: item)
        
        let router = CommentRouter(controller: controller)
        
        presenter.interactor = interactor
        
        presenter.router = router
        
    }
    
}
