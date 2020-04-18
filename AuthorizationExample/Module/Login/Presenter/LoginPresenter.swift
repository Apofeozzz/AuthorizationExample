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
	
}

// MARK: - PRESENTER PROTOCOL -

protocol LoginPresenterProtocol: class {
	
	init(view: LoginViewProtocol)
	
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
	
}
