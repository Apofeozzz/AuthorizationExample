//
//  GoogleSignInService.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 4/24/20.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import Firebase
import GoogleSignIn

class GoogleSignInService: NSObject {
    
    var controller: UIViewController
    
    var signInCompletion: () -> Void
    
    init(controller: UIViewController, completion: @escaping () -> Void) {
        
        self.controller = controller
        
        self.signInCompletion = completion
        
    }
    
    func signIn() {
        
        GIDSignIn.sharedInstance()?.delegate = self
        GIDSignIn.sharedInstance()?.presentingViewController = controller
        GIDSignIn.sharedInstance()?.signIn()
        
    }
    
}

extension GoogleSignInService: GIDSignInDelegate {
    // MARK: - GIDSignInDelegate
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        
        if let err = error {
            print(err.localizedDescription)
            return
        }
        
        guard let authentication = user.authentication else { return }
        
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                       accessToken: authentication.accessToken)
        
        Auth.auth().signIn(with: credential) { [weak self] (authResult, error) in
            
            if let err = error {
                print(err.localizedDescription)
                return
            }
            
            self?.signInCompletion()
            
            print("User signed in")
            
            print("Access token:")
            print(authentication.accessToken!)
            
            print("Client ID")
            print(authentication.clientID!)
            
            print("Username: \(user.profile.name!)")
            print("Email \(user.profile.email!)")
            
        }

    }
}
