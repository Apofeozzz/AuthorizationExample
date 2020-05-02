//
//  DetailInteractor.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 5/2/20.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import Foundation

class DetailInteractor: DetailInteractorProtocol {
    
    // MARK: - DATA SOURCE -
    
    weak var presenter: DetailPresenterProtocol!
    
    // MARK: - INIT -
    
    required init(presenter: DetailPresenterProtocol) {
        
        self.presenter = presenter
        
    }
    
}
