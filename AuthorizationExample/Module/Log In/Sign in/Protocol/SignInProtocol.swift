//
//  SignInProtocols.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 4/20/20.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import UIKit

// MARK: - CONFIGURATOR -

protocol SignInConfiguratorProtocol: class {
    
    func configure(with controller: SignInViewController)
    
}

// MARK: - VIEW -

protocol SignInViewProtocol: class {
    
    func hideGoogleSignInButton()
    
}

// MARK: - INTERACTOR -

protocol SignInInteractorProtocol: class {
    
    var presenter: SignInPresenterProtocol! { get }
    
    init(presenter: SignInPresenterProtocol)
    
    func signInWithGoogle(router: NavigationProtocol)
    
}

// MARK: - PRESENTER -

protocol SignInPresenterProtocol: class {
    
    init(view: SignInViewProtocol)
    
    func signUpWithEmail()
    
    func signIn()
    
    func signInWithGoogle()
    
    func signedInWithGoogle(error: Error?)
    
}

// MARK: - ROUTER -

protocol SignInRouterProtocol: NavigationProtocol { }

