//
//  HomePresenter.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 4/24/20.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import Foundation

class HomePresenter: HomePresenterProtocol {
    
    // MARK: - DATA SOURCE -
    
    weak var view: HomeViewProtocol!
    
    var interactor: HomeInteractorProtocol!
    
    var router: HomeRouterProtocol!
    
    // MARK: - INIT -
    
    required init(view: HomeViewProtocol) {
        
        self.view = view
        
    }
    
    // MARK: - ACTION -
    
    func signOut() {
        
        interactor.signOut()
        
        let signInVC = Builder.loginBuilder().signInController()
        
        router.changeRootController(signInVC)
        
    }
    
    func add() { addController() }
    
    func numberOfRows() -> Int { interactor.numberOfRows() }
    
    func dataForRow(_ row: Int) -> Vine {
        
        interactor.dataForRow(row)
        
    }
    
    // MARK: - NAVIGATION -
    
    private func addController() {
        
        let addVC = Builder.addBuilder().addController(dataSource: interactor.dataSource)
        
        router.pushController(addVC)
        
    }
    
}