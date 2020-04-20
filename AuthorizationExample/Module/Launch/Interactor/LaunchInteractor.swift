//
//  LaunchInteractor.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 4/20/20.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import Foundation

class LaunchInteractor: LaunchInteractorProtocol {
    
    // MARK: - PRESENTER -
    
    weak var presenter: LaunchViewPresenterProtocol!
    
    // MARK: - INIT -
    
    required init(presenter: LaunchViewPresenterProtocol) {
        
        self.presenter = presenter
        
    }
    
    // MARK: - ACTION -
    
    func checkIfUserLoggedIn() -> Bool {
        
        return false
        
    }
    
}
