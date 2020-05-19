//
//  FirebaseSignUpService.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 4/26/20.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import FirebaseAuth

class FirebaseSignUpService: SignUpWithEmailProtocol {
    
    var signUpResponse: ((Error?) -> Void)?
    
    func signUpWith(email: String, and password: String) {
        
        Auth.auth().createUser(withEmail: email, password: password) {[weak self] (result, error) in
            
//            print(result?.description)
            
            self?.signUpResponse?(error)
            
        }
        
    }
    
    
}
