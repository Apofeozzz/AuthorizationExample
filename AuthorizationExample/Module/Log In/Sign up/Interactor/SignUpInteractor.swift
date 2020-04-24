//
//  SignUpInteractor.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 4/25/20.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import Foundation

class SignUpInteractor: SignUpInteractorProtocol {
    
    // MARK: - PRESENTER -
    
    var presenter: SignUpPresenterProtocol!
    
    // MARK: - INIT -
    
    required init(presenter: SignUpPresenterProtocol) {
        self.presenter = presenter
    }
    
}
