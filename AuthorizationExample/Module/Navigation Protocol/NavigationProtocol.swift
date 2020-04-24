//
//  NavigationProtocol.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 18.04.2020.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import UIKit

protocol NavigationProtocol {
    
    var controller: UIViewController! { get }
    
    init(controller: UIViewController)
    
}

extension NavigationProtocol {
	
	func presentController(_ controller: UIViewController) {
		
        self.controller.present(controller, animated: true, completion: nil)
		
	}
	
	func pushController(_ controller: UIViewController) {
		
        self.controller.navigationController?.pushViewController(controller, animated: true)
		
	}
	
	func popController(_ controller: UIViewController) {
		
        self.controller.navigationController?.popViewController(animated: true)
		
	}
	
	func dismissController() {
		
        self.controller.dismiss(animated: true, completion: nil)
		
	}
    
    // MARK: - SHOW ALERT -
    
    func showAlert(title: String, message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        controller.present(alert, animated: true, completion: nil)
        
    }
	
}
