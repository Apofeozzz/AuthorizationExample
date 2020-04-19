//
//  LoginPresenter.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 18.04.2020.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import UIKit

// MARK: - VIEW PROTOCOL -

protocol LoginViewProtocol: NavigationProtocol {
	
	func showAlert(title: String, message: String)
	
}

// MARK: - PRESENTER PROTOCOL -

protocol LoginPresenterProtocol: class {
	
	init(view: LoginViewProtocol)
	
	func login(email: String?, password: String?)
	
}

// MARK: - PRESENTER -

class LoginPresenter: LoginPresenterProtocol {
	
	// MARK: - DATA SOURCE -
	
	weak var view: LoginViewProtocol?
	
	// MARK: - INIT -
	
	required init(view: LoginViewProtocol) {
		
		self.view = view
		
	}
	
	// MARK: - ACTION -
	
	func login(email: String?, password: String?) {
		
		if !checkEmailAndPassword(email: email, password: password) { return }
		
//		guard let email = email, let password = password else { return }
		
		// Login action
		
	}
	
	private func checkEmailAndPassword(email: String?, password: String?) -> Bool {
		
		guard let email = email, let password = password
			
			else {
				
				view?.showAlert(title: "Error", message: "Textfields are empty")
				
				return false
				
		}
		
		if !email.isValidEmail() {
			
			view?.showAlert(title: "Error", message: "Please enter your email")
			
			return false
			
		}
		
		if email.isEmpty {
			
			view?.showAlert(title: "Error", message: "Please enter correct email address")
			
			return false
			
		}
		
		if password.isEmpty {
			
			view?.showAlert(title: "Error", message: "Please enter your password")
			
			return false
			
		}
		
		return true
		
	}
	
}
