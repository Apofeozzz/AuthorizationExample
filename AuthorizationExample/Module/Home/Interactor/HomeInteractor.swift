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
    
    var dataSource: DataSource!
    
    // MARK: - INIT -
    
    required init(presenter: HomePresenterProtocol) {
        
        self.presenter = presenter
        
    }
    
    // MARK: - ACTION -
    
    func signOut() {
        
        do { try Auth.auth().signOut() }
        
        catch let err {
            
            print(err.localizedDescription)
            
        }
            
        
    }
    
    func numberOfRows() -> Int { dataSource.vines.count }
    
    func dataForRow(_ row: Int) -> Vine {
        
        if dataSource.vines.count > row {
            
            return dataSource.vines[row]
            
        }
        
        fatalError("Home interactor doesn't have so many objects")
        
    }
    
}
