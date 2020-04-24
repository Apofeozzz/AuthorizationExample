//
//  LoginBuilder.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 18.04.2020.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import UIKit

class LoginBuilder {
    
    func signInController() -> UIViewController {
        
        let signInController = SignInViewController()
        
        let navigationController = UINavigationController(rootViewController: signInController)
        
        navigationController.modalPresentationStyle = .fullScreen
        
        return navigationController
        
    }
	
	func loginController() -> UIViewController {

		LoginViewController()

	}
	
}
