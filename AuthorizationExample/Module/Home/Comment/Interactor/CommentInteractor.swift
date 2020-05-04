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
    
    var dataSource: DataSourceServiceProtocol
    
    var item: Item
    
    // MARK: - INIT -
    
    required init(presenter: CommentPresenterProtocol, dataSource: DataSourceServiceProtocol, item: Item) {
        
        self.presenter = presenter
        
        self.dataSource = dataSource
        
        self.item = item
        
    }
    
    // MARK: - ACTION -
    
    func saveComment(_ comment: String) {
        
        item.review.append(comment)
        
        dataSource.saveReview(in: item) { [weak self] in
            guard let ss = self else { return }
            
            DispatchQueue.main.async {
                ss.presenter.popController()
            }
            
        }
        
    }
    
}
