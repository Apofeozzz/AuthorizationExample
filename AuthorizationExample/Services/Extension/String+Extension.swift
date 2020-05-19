//
//  String+Extension.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 18.04.2020.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import Foundation

// MARK: - EMAIL VALIDATION -

extension String {
	
	 func isValidEmail() -> Bool {
		
		let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
		
		let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
		
		return emailPred.evaluate(with: self)
	}
	
}
