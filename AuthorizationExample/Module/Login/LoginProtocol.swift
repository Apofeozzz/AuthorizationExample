//
//  LoginProtocol.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 4/20/20.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import Foundation

// MARK: - CONFIGURATOR -

protocol LoginConfiguratorProtocol: class {
    
    func configure(with controller: LoginViewController)
    
}

// MARK: - VIEW -

protocol LoginViewProtocol: class { }

// MARK: - INTERACTOR -

protocol LoginInteractorProtocol: class {
    
    var presenter: LoginPresenterProtocol! { get set }
    
    init(presenter: LoginPresenterProtocol)
    
    func checkEmailAndPassword(email: String?, password: String?) -> CheckEmailResult
    
}

// MARK: - PRESENTER -

protocol LoginPresenterProtocol: class {
    
    init(view: LoginViewProtocol)
    
    func login(email: String?, password: String?)
    
}

// MARK: - ROUTER -

protocol LoginRouterProtocol: NavigationProtocol {
    
    func showAlert(title: String, message: String)
    
}
