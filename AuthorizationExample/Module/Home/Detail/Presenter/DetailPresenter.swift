//
//  DetailPresenter.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 5/2/20.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import Foundation

class DetailPresenter: DetailPresenterProtocol {
    
    // MARK: - DATA SOURCE -
    
    weak var view:  DetailViewProtocol!
    
    var interactor: DetailInteractorProtocol!
    
    var router: DetailRouterProtocol!
    
    var item: Item!
    
    // MARK: - INIT -
    
    required init(view: DetailViewProtocol, item: Item) {
        
        self.view = view
        
        self.item = item
        
    }
    
    // MARK: - ACTION -
    
    func navigationTitle() -> String {
        
        item.title
        
    }
    
    func itemForCell() -> Item {
        
        return item
        
    }
    
}
