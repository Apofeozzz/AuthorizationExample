//
//  LaunchScreenPresenter.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 18.04.2020.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import UIKit

// MARK: - PRESENTER -

class LaunchViewPresenter: LaunchViewPresenterProtocol {
	
	// MARK: - DATA SOURCE -
	
	weak var view: LaunchViewProtocol!
    
    var interactor: LaunchInteractorProtocol!
    
    var router: LaunchRouterProtocol!
	
	// MARK: - INIT -
	
	required init(view: LaunchViewProtocol) {
		
		self.view = view
		
	}
	
	// MARK: - ACTION -
	
	func checkLoggedUser() {
		
		loginController()
		
	}
	
	func loginController() {
        
        if interactor.checkIfUserLoggedIn() {
            
            // move to home module
            
        } else {
            
            let signIn = Builder.loginBuilder().signInController()
            
            router.presentController(signIn)
            
        }
		
	}
	
}


