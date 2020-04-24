//
//  SignInPresenter.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 4/19/20.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

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
    
    func signInWithGoogle() {
        
        interactor.signInWithGoogle(router: router)
        
    }
    
    func signedInWithGoogle(error: Error?) {
        
        if let err = error {
            print(err.localizedDescription)
            return
        }
        
        homeController()
        
    }
    
    func homeController() {
        
        let home = Builder.homeBuilder().homeController()
        
        router.presentController(home)
        
    }
    
}
