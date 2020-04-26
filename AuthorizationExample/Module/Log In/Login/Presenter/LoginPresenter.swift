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
    
    var interactor: LoginInteractorProtocol!
    
    var router: LoginRouterProtocol!
	
	// MARK: - INIT -
	
	required init(view: LoginViewProtocol) {
		
		self.view = view
		
	}
	
	// MARK: - ACTION -
    
    func checkTextFields(email: String?, password: String?) {
        
        guard
            let email = email,
            let password = password
            else { return }
        
        if !email.isEmpty && !password.isEmpty && password.count > 5 {
            
            view?.activateLoginButton()
            
        } else { view?.disactivateLoginButton() }
        
    }
    
    // MARK: - LOGIN -
	
	func login(email: String?, password: String?) {
        
        let checkInput = interactor.checkEmailAndPassword(email: email, password: password)
        
        if checkInput.result {
            
            interactor.loginWith(email: email!, and: password!)
            
        } else {
            
            if let message = checkInput.message {
             
                router.showAlert(title: checkInput.title,
                                 message: message)
                
            }

        }
		
	}
	
    func userLoggedIn(error: Error?) {
        
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
