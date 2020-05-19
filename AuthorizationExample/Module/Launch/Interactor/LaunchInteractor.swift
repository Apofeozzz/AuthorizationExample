//
//  LaunchInteractor.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 4/20/20.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import Foundation
import FirebaseAuth

class LaunchInteractor: LaunchInteractorProtocol {
    
    // MARK: - PRESENTER -
    
    weak var presenter: LaunchViewPresenterProtocol!
    
    // MARK: - INIT -
    
    required init(presenter: LaunchViewPresenterProtocol) {
        
        self.presenter = presenter
        
    }
    
    // MARK: - ACTION -
    
    func checkIfUserLoggedIn() -> Bool {
        
        if let _ = Auth.auth().currentUser { return true }
        
        return false
        
    }
    
}
