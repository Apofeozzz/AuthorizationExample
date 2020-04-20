//
//  SignInProtocols.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 4/20/20.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

// MARK: - CONFIGURATOR -

protocol SignInConfiguratorProtocol: class {
    
    func configure(with controller: SignInViewController)
    
}

// MARK: - VIEW -

protocol SignInViewProtocol: class {
    
}

// MARK: - INTERACTOR -

protocol SignInInteractorProtocol: class {
    
    var presenter: SignInPresenterProtocol! { get }
    
    init(presenter: SignInPresenterProtocol)
    
}

// MARK: - PRESENTER -

protocol SignInPresenterProtocol: class {
    
    init(view: SignInViewProtocol)
    
    func signIn()
    
}

// MARK: - ROUTER -

protocol SignInRouterProtocol: NavigationProtocol { }

