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
    
    var dataSource: DataSource! { get set }
    
    init(presenter: HomePresenterProtocol)
    
    func signOut()
    
    func numberOfRows() -> Int
    
    func dataForRow(_ row: Int) -> Vine
    
}

// MARK: - PRESENTER -

protocol HomePresenterProtocol: class {
    
    init(view: HomeViewProtocol)
    
    func signOut()
    
    func add()
    
    func numberOfRows() -> Int
    
    func dataForRow(_ row: Int) -> Vine
    
}

// MARK: - ROUTER -

protocol HomeRouterProtocol: NavigationProtocol {
    
}
