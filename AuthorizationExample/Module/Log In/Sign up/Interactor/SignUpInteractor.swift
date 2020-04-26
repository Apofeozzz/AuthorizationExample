//
//  SignUpInteractor.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 4/25/20.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import Foundation

protocol SignUpWithEmailProtocol: class {
    
    var signUpResponse: ((Error?) -> Void)? { get set }
    
    func signUpWith(email: String, and password: String)
    
}

class SignUpInteractor: SignUpInteractorProtocol {
    
    // MARK: - PRESENTER -
    
    var presenter: SignUpPresenterProtocol!
    
    var firebaseSignUpService: SignUpWithEmailProtocol?
    
    // MARK: - INIT -
    
    required init(presenter: SignUpPresenterProtocol) {
        
        self.presenter = presenter
        
    }
    
    // MARK: - ACTION -
    
    func checkEmailAndPassword(email: String?, password: String?) -> CheckEmailResult {
        
        guard let email = email, let password = password
            
            else {
                
                return CheckEmailResult(result: false, message: "Textfields are empty")
                
        }
        
        if !email.isValidEmail() {
            
            return CheckEmailResult(result: false, message: "Please enter correct email address")
            
        }
        
        if email.isEmpty {
            
            return CheckEmailResult(result: false, message: "Please enter your email")
            
        }
        
        if password.isEmpty {
            
            return CheckEmailResult(result: false, message: "Please enter your password")
            
        }
        
        return CheckEmailResult()
        
    }
    
    func signUp(email: String, password: String) {
        
        firebaseSignUpService = FirebaseSignUpService()
        
        firebaseSignUpService?.signUpResponse = { [weak self] (error) in
            
            self?.presenter.userCreated(error: error)
            
        }
        
        firebaseSignUpService?.signUpWith(email: email, and: password)
        
    }
    
}
