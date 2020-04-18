//
//  LoginBuilder.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 18.04.2020.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import UIKit

class LoginBuilder {
	
	func loginController() -> UIViewController {
		
		let view = LoginViewController()
		
		let presenter = LoginPresenter(view: view)
		
		view.presenter = presenter
		
		let navigationController = UINavigationController(rootViewController: view)
		
		navigationController.modalPresentationStyle = .fullScreen
		
		return navigationController
		
	}
	
}