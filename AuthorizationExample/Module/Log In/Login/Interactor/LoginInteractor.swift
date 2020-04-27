//
//  LoginInteractor.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 4/20/20.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import Foundation

protocol LoginWithEmailProtocol: class {
    
    var signInResponse: ((Error?) -> Void)? { get set }
    
    func signInWith(email: String, and password: String)
    
}

class LoginInteractor: LoginInteractorProtocol {
    
    // MARK: - DATA SOURCE -
    
    weak var presenter: LoginPresenterProtocol!
    
    var firebaseSignInService: LoginWithEmailProtocol?
    
    // MARK: - INIT -
    
    required init(presenter: LoginPresenterProtocol) {
        
        self.presenter = presenter
        
    }
 
    // MARK: - ACTION -
    
    func checkEmailAndPassword(email: String?, password: String?) -> CheckForm {
        
        guard let email = email, let password = password
            
            else {
                
                return CheckForm(result: false, message: "Textfields are empty")
                
        }
        
        if !email.isValidEmail() {
            
            return CheckForm(result: false, message: "Please enter correct email address")
            
        }
        
        if email.isEmpty {
            
            return CheckForm(result: false, message: "Please enter your email")
            
        }
        
        if password.isEmpty {
            
            return CheckForm(result: false, message: "Please enter your password")
            
        }
        
        return CheckForm()
        
    }
    
    // MARK: - LOGIN -
    
    func loginWith(email: String, and password: String) {
        
        firebaseSignInService = FirebaseSignInService()
        
        firebaseSignInService?.signInResponse = { [weak self] (error) in
            
            self?.presenter.userLoggedIn(error: error)
            
        }
        
        firebaseSignInService?.signInWith(email: email, and: password)
        
    }
    
}
