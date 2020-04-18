//
//  NavigationProtocol.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 18.04.2020.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import UIKit

protocol NavigationProtocol: UIViewController { }

extension NavigationProtocol {
	
	func presentController(_ controller: UIViewController) {
		
		present(controller, animated: true, completion: nil)
		
	}
	
	func pushController(_ controller: UIViewController) {
		
		navigationController?.pushViewController(controller, animated: true)
		
	}
	
	func popController(_ controller: UIViewController) {
		
		navigationController?.popViewController(animated: true)
		
	}
	
	func dismissController() {
		
		dismiss(animated: true, completion: nil)
		
	}
	
}
