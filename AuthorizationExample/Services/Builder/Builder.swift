//
//  Builder.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 18.04.2020.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import UIKit

class Builder {
	
	static func launchBuilder() -> LaunchBuilder {
		
		LaunchBuilder()
		
	}
	
	static func loginBuilder() -> LoginBuilder {
		
		LoginBuilder()
		
	}
	
    static func homeBuilder() -> HomeBuilder {
        
        HomeBuilder()
        
    }
    
}
