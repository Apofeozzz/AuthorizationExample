//
//  SignUpPresenterProtocol.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 4/25/20.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import Foundation

class SignUpPresenter: SignUpPresenterProtocol {
    
    // MARK: - DATA SOURCE -
    
    weak var view: SignUpViewProtocol!
    
    var interactor: SignUpInteractorProtocol!
    
    var router: SignUpRouterProtocol!
    
    // MARK: - INIT -
    
    required init(view: SignUpViewProtocol) {
        self.view = view
    }
    
}
