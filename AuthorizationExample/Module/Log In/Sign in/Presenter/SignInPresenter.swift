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
    
    // MARK: - SIGN UP WITH EMAIL -
    
    func signUpWithEmail() {
        
        let signUpVC = Builder.loginBuilder().signUpController()
        
        router.pushController(signUpVC)
        
    }
    
    // MARK: - SIGN IN WITH EMAIL -
    
    func signIn() {
        
        let logInController = Builder.loginBuilder().loginController()
        
        router.pushController(logInController)
        
    }
    
    // MARK: - GOOGLE SIGN IN -
    
    func signInWithGoogle() {
        
        interactor.signInWithGoogle(router: router)
        
    }
    
    func signedInWithGoogle(error: Error?) {
        
        if let err = error {
            
            router.showAlert(title: "Error",
                             message: err.localizedDescription)
            
            return
            
        }
        
        homeController()
        
    }
    
    // MARK: - NAVIGATION -
    
    func homeController() {
        
        let home = Builder.homeBuilder().homeController()
        
        router.presentController(home)
        
    }
    
}
