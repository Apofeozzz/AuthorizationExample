//
//  HomeProtocol.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 4/24/20.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import Foundation
import UIKit

// MARK: - CONFIGURATOR -

protocol HomeConfiguratorProtocol: class {
    
    func configure(with controller: HomeViewController)
    
}

// MARK: - LAYOUT -

protocol HomeViewLayoutProtocol: UIView {
    
    var vineTableView: UITableView! { get set }
    
}

// MARK: - VIEW -

protocol HomeViewProtocol: class {
    
    func reloadTableView()
    
}

// MARK: - INTERACTOR -

protocol HomeInteractorProtocol: class {
    
    var presenter: HomePresenterProtocol! { get set }
    
    var dataSource: DataSourceServiceProtocol! { get set }
    
    init(presenter: HomePresenterProtocol,
         dataSource: DataSourceServiceProtocol)
    
    func signOut()
    
    func numberOfRows() -> Int
    
    func dataForRow(_ row: Int) -> Item
    
}

// MARK: - PRESENTER -

protocol HomePresenterProtocol: class {
    
    init(view: HomeViewProtocol)
    
    func signOut()
    
    func add()
    
    func numberOfRows() -> Int
    
    func dataForRow(_ row: Int) -> Item
    
    func selectItem(_ index: Int)
    
}

// MARK: - ROUTER -

protocol HomeRouterProtocol: NavigationProtocol {
    
}
