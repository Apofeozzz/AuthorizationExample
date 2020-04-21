//
//  LoginPresenter.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 18.04.2020.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

// MARK: - PRESENTER -

class LoginPresenter: LoginPresenterProtocol {
	
	// MARK: - DATA SOURCE -
	
	weak var view: LoginViewProtocol?
    
    var interactor: LoginInteractor!
    
    var router: LoginRouter!
	
	// MARK: - INIT -
	
	required init(view: LoginViewProtocol) {
		
		self.view = view
		
	}
	
	// MARK: - ACTION -
	
	func login(email: String?, password: String?) {
        
        let checkInput = interactor.checkEmailAndPassword(email: email, password: password)
        
        if checkInput.result {
            
            //        guard let email = email, let password = password else { return }
            
            // Login action
            
        } else {
            
            if let message = checkInput.message {
             
                router.showAlert(title: checkInput.title, message: message)
                
            }

        }
		
	}
    
    func checkTextFields(email: String?, password: String?) {
        
        guard
            let email = email,
            let password = password
            else { return }
        
        if !email.isEmpty && !password.isEmpty && password.count > 5 {
            
            view?.activateLoginButton()
            
        } else { view?.disactivateLoginButton() }
        
    }
	
}
