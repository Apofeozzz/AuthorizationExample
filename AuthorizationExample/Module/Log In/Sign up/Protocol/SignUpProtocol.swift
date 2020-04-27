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
    
    func activateSignUpButton()
    
    func disactivateSignUpButton()
    
}

// MARK: - INTERACTOR -

protocol SignUpInteractorProtocol: class {
    
    init(presenter: SignUpPresenterProtocol)
    
    func checkEmailAndPassword(email: String?, password: String?) -> CheckForm
    
    func signUp(email: String, password: String)
    
}

// MARK: - PRESENTER -

protocol SignUpPresenterProtocol: class {
    
    init(view: SignUpViewProtocol)
    
    func checkTextFields(email: String?, password: String?, confirmation: String?)
    
    func signUp(email: String?, password: String?)
    
    func userCreated(error: Error?)
    
}

// MARK: - ROUTER -

protocol SignUpRouterProtocol: NavigationProtocol {
    
}

