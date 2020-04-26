//
//  LaunchScreenPresenter.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 18.04.2020.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

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
	
	func checkLoggedUser() { loginController() }
	
	func loginController() {
        
        if interactor.checkIfUserLoggedIn() { homeController() }
        
        else { signInController() }
		
	}
    
    // MARK: - NAVIGATION -
    
    func signInController() {
        
        let signIn = Builder.loginBuilder().signInController()
        
        router.presentController(signIn)
        
    }
    
    func homeController() {
        
        let home = Builder.homeBuilder().homeController()
        
        router.presentController(home)
        
    }
	
}


