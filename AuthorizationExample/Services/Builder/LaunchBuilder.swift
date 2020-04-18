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
		
		let view = LaunchViewController()
		
		let presenter = LaunchViewPresenter(view: view)
		
		view.presenter = presenter
		
		return view
		
	}
	
}
