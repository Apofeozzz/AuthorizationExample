//
//  CommentPresenter.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 5/4/20.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import Foundation

class CommentPresenter: CommentPresenterProtocol {

    // MARK: - DATA SOURCE -
    
    weak var view: CommentViewProtocol!
    
    var interactor: CommentInteractorProtocol!
    
    var router: CommentRouterProtocol!
    
    // MARK: - INIT -
    
    required init(view: CommentViewProtocol) {
        
        self.view = view
        
    }
    
    // MARK: - ACTION -
    

}
