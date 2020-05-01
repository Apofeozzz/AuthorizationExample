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
    
    var dataSource: DataSourceServiceProtocol!
    
    // MARK: - INIT -
    
    required init(presenter: HomePresenterProtocol,
                  dataSource: DataSourceServiceProtocol) {
        
        self.presenter = presenter
        
        self.dataSource = dataSource
        
    }
    
    // MARK: - ACTION -
    
    func signOut() {
        
        do { try Auth.auth().signOut() }
        
        catch let err {
            
            print(err.localizedDescription)
            
        }
            
        
    }
    
    func numberOfRows() -> Int { dataSource.returnData().count }
    
    func dataForRow(_ row: Int) -> Item {
        
        if dataSource.returnData().count > row {
            
            return dataSource.returnData()[row]
            
        }
        
        fatalError("Home interactor doesn't have so many objects")
        
    }
    
}
