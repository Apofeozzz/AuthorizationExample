//
//  LoginBuilder.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 18.04.2020.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import UIKit

class LaunchBuilder {
	
	func launchController() -> UIViewController {
		
        let launchVC = LaunchViewController()
        
        let configurator: LaunchConfiguratorProtocol = LaunchConfigurator()
        configurator.configure(with: launchVC)
        
		return launchVC
		
	}
	
}
