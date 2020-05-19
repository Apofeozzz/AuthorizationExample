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
        
        let signInVC = SignInViewController()
        
        let configurator: SignInConfiguratorProtocol = SignInConfigurator()
        
        configurator.configure(with: signInVC)
        
        let navigationController = UINavigationController(rootViewController: signInVC)
        
        navigationController.modalPresentationStyle = .fullScreen
        
        return navigationController
        
    }
	
    func signUpController() -> UIViewController {
        
        let signUpVC = SignUpViewController()
        
        let configurator: SignUpConfiguratorProtocol = SignUpConfigurator()
        
        configurator.configure(with: signUpVC)
        
        return signUpVC
        
    }
    
	func loginController() -> UIViewController {

        let loginVC = LoginViewController()
        
        let configurator: LoginConfiguratorProtocol = LoginConfigurator()
        
        configurator.configure(with: loginVC)
        
		return loginVC

	}
	
}
