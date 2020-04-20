//
//  SignInInteractor.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 4/20/20.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import Foundation

class SignInInteractor: SignInInteractorProtocol {
    
    // MARK: - PRESENTER -
    
    weak var presenter: SignInPresenterProtocol!
    
    // MARK: - INIT -
    
    required init(presenter: SignInPresenterProtocol) {
        
        self.presenter = presenter
        
    }
    
}
