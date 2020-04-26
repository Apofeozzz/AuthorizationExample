//
//  HomeInteractor.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 4/24/20.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import Foundation
import FirebaseAuth

class HomeInteractor: HomeInteractorProtocol {
    
    // MARK: - DATA SOURCE -
    
    weak var presenter: HomePresenterProtocol!
    
    // MARK: - INIT -
    
    required init(presenter: HomePresenterProtocol) {
        
        self.presenter = presenter
        
    }
    
    // MARK: - ACTION -
    
    func signOut() {
        
        try? Auth.auth().signOut()
        
    }
    
}
