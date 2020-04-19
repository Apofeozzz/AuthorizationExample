//
//  SignInPresenter.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 4/19/20.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import UIKit

// MARK: - VIEW PROTOCOL -

protocol SignInViewProtocol: NavigationProtocol {
    
}

// MARK: - PRESENTER PROTOCOL -

protocol SignInPresenterProtocol: class {
    
    init(view: SignInViewProtocol)
    
}

// MARK: - PRESENTER -

class SignInPresenter: SignInPresenterProtocol {
    
    // MARK: - DATA SOURCE -
    
    weak var view: SignInViewProtocol?
    
    // MARK: - INIT -
    
    required init(view: SignInViewProtocol) {
        
        self.view = view
        
    }
    
}
