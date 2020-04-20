//
//  LaunchProtocol.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 4/20/20.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

// MARK: - VIEW -

protocol LaunchViewProtocol: class {
    
}

// MARK: - INTERACTOR -

protocol LaunchInteractorProtocol: class {
    
    func checkIfUserLoggedIn() -> Bool
    
}

// MARK: - PRESENTER -

protocol LaunchViewPresenterProtocol: class {
    
    init(view: LaunchViewProtocol)
    
    func checkLoggedUser()
    
}

// MARK: - ROUTER -

protocol LaunchRouterProtocol: NavigationProtocol { }

// MARK: - CONFIGURATOR -

protocol LaunchConfiguratorProtocol: class {
    
    func configure(with controller: LaunchViewController)
    
}

