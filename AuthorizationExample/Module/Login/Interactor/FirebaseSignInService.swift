//
//  FirebaseSignInService.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 4/25/20.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import FirebaseAuth

class FirebaseSignInService {
    
    var signInResponse: ((Error?) -> Void)?
    
    func signInWith(email: String, and password: String) {
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] (authResult, error) in
            
            print(authResult?.description)
            
            self?.signInResponse?(error)
            
        }
        
    }
    
}
