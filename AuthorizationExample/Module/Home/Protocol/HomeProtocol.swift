//
//  HomeProtocol.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 4/24/20.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import Foundation

// MARK: - CONFIGURATOR -

protocol HomeConfiguratorProtocol: class {
    
    func configure(with controller: HomeViewController)
    
}

// MARK: - VIEW -

protocol HomeViewProtocol: class {
    
}

// MARK: - INTERACTOR -

protocol HomeInteractorProtocol: class {
    
    var presenter: HomePresenterProtocol! { get set }
    
    init(presenter: HomePresenterProtocol)
    
    func signOut()
    
}

// MARK: - PRESENTER -

protocol HomePresenterProtocol: class {
    
    init(view: HomeViewProtocol)
    
    func signOut()
    
    func add()
    
}

// MARK: - ROUTER -

protocol HomeRouterProtocol: NavigationProtocol {
    
}
