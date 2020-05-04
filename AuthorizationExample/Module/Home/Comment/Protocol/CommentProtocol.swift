//
//  NewCommentProtocol.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 5/3/20.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import Foundation

// MARK: - CONFIGURATOR -

protocol CommentConfiguratorProtocol: class {
    
    func configure(with controller: CommentViewController,
                   dataSource: DataSourceServiceProtocol,
                   and item: Item)
    
}

// MARK: - LAYOUT -

protocol CommentLayoutProtocol: class {
    
}

// MARK: - VIEW -

protocol CommentViewProtocol: class {
    
}

// MARK: - INTERACTOR -

protocol CommentInteractorProtocol: class {
    
    init(presenter: CommentPresenterProtocol,
         dataSource: DataSourceServiceProtocol,
         item: Item)
    
    func saveComment(_ comment: String)
    
}

// MARK: - PRESENTER -

protocol CommentPresenterProtocol: class {
    
    init(view: CommentViewProtocol)
    
    func save(comment: String)
    
    func popController()
    
}

// MARK: - ROUTER -

protocol CommentRouterProtocol: NavigationProtocol { }
