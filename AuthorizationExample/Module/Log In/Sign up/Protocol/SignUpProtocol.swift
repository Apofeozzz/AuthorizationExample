//
//  SignUpProtocol.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 4/25/20.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

// MARK: - CONFIGURATOR -

protocol SignUpConfiguratorProtocol: class {
    
    func configure(with controller: SignUpViewController)
    
}

// MARK: - VIEW -

protocol SignUpViewProtocol: class {
    
}

// MARK: - INTERACTOR -

protocol SignUpInteractorProtocol: class {
    
    init(presenter: SignUpPresenterProtocol)
    
}

// MARK: - PRESENTER -

protocol SignUpPresenterProtocol: class {
    
    init(view: SignUpViewProtocol)
    
}

// MARK: - ROUTER -

protocol SignUpRouterProtocol: NavigationProtocol {
    
}

