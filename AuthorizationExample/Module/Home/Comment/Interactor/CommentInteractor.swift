//
//  CommentInteractor.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 5/4/20.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import Foundation

class CommentInteractor: CommentInteractorProtocol {
    
    // MARK: - DATA SOURCE -
    
    weak var presenter: CommentPresenterProtocol!
    
    // MARK: - INIT -
    
    required init(presenter: CommentPresenterProtocol) {
        
        self.presenter = presenter
        
    }
    
    // MARK: - ACTION -
    
}
