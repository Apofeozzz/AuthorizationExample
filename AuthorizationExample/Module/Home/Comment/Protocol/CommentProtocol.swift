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
    
    func configure(with controller: CommentViewController)
    
}

// MARK: - LAYOUT -

protocol CommentLayoutProtocol: class {
    
}

// MARK: - VIEW -

protocol CommentViewProtocol: class {
    
}

// MARK: - INTERACTOR -

protocol CommentInteractorProtocol: class {
    
    init(presenter: CommentPresenterProtocol)
    
}

// MARK: - PRESENTER -

protocol CommentPresenterProtocol: class {
    
    init(view: CommentViewProtocol)
    
}

// MARK: - ROUTER -

protocol CommentRouterProtocol: NavigationProtocol { }
