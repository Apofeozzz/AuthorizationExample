//
//  LaunchScreenPresenter.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 18.04.2020.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import UIKit

// MARK: - UIVIEW PROTOCOL -

protocol LaunchViewProtocol: NavigationProtocol {
	
}

// MARK: - PRESENTER PROTOCOL -

protocol LaunchViewPresenterProtocol: class {
	
	init(view: LaunchViewProtocol)
	
	func checkLoggedUser()
	
}

// MARK: - PRESENTER -

class LaunchViewPresenter: LaunchViewPresenterProtocol {
	
	// MARK: - DATA SOURCE -
	
	weak var view: LaunchViewProtocol?
	
	// MARK: - INIT -
	
	required init(view: LaunchViewProtocol) {
		
		self.view = view
		
	}
	
	// MARK: - ACTION -
	
	func checkLoggedUser() {
		
		loginController()
		
	}
	
	func loginController() {
		
        let signIn = Builder.loginBuilder().signInController()
		
		view?.presentController(signIn)
		
	}
	
}


