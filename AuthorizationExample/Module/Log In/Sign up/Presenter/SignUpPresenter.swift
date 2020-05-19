//
//  SignUpPresenterProtocol.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 4/25/20.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import Foundation

class SignUpPresenter: SignUpPresenterProtocol {
    
    // MARK: - DATA SOURCE -
    
    weak var view: SignUpViewProtocol!
    
    var interactor: SignUpInteractorProtocol!
    
    var router: SignUpRouterProtocol!
    
    // MARK: - INIT -
    
    required init(view: SignUpViewProtocol) {
        self.view = view
    }
    
    // MARK: - ACTION -
    
    func checkTextFields(email: String?, password: String?, confirmation: String?) {
        
        guard
            let email = email,
            let password = password,
            let confirmation = confirmation
            else { return }
        
        if !email.isEmpty && !password.isEmpty && password.count > 5 && confirmation == password {
            
            view?.activateSignUpButton()
            
        } else { view?.disactivateSignUpButton() }
        
    }
    
    // MARK: - SIGN UP -
    
    func signUp(email: String?, password: String?) {
        
        let checkInput = interactor.checkEmailAndPassword(email: email, password: password)
        
        if checkInput.result {
            
            interactor.signUp(email: email!, password: password!)
            
        } else {
            
            if let message = checkInput.message {
             
                router.showAlert(title: checkInput.title,
                                 message: message)
                
            }

        }
        
    }
    
    func userCreated(error: Error?) {
        
        if let err = error {
            
            router.showAlert(title: "Error", message: err.localizedDescription)
            
            return
            
        }
        
        router.showHomeController()
        
    }

}
