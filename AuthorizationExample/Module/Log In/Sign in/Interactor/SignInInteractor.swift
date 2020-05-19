//
//  SignInInteractor.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 4/20/20.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import Foundation

protocol GoogleSignInProtocol: class {
    
    func signIn()
    
}

class SignInInteractor: SignInInteractorProtocol {
    
    // MARK: - PRESENTER -
    
    weak var presenter: SignInPresenterProtocol!
    
    var googleService: GoogleSignInProtocol?
    
    // MARK: - INIT -
    
    required init(presenter: SignInPresenterProtocol) {
        
        self.presenter = presenter
        
    }
    
    // MARK: - SIGN IN WITH GOOGLE -
    
    func signInWithGoogle(router: NavigationProtocol) {
        
        googleService = GoogleSignInService(controller: router.controller) { [weak self] in
            
            self?.presenter.signedInWithGoogle(error: nil)
            
        }
        
        googleService?.signIn()
        
    }
    
}
