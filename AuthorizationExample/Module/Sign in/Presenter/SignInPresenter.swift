//
//  SignInPresenter.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 4/19/20.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import UIKit

// MARK: - PRESENTER -

class SignInPresenter: SignInPresenterProtocol {
    
    // MARK: - DATA SOURCE -
    
    weak var view: SignInViewProtocol!
    
    var interactor: SignInInteractorProtocol!
    
    var router: SignInRouterProtocol!
    
    // MARK: - INIT -
    
    required init(view: SignInViewProtocol) {
        
        self.view = view
        
    }
    
    // MARK: - ACTION -
    
    func signIn() {
        
        let logInController = Builder.loginBuilder().loginController()
        
        router.pushController(logInController)
        
    }
    
}
