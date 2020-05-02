//
//  DetailProtocol.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 5/2/20.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import Foundation
import UIKit

// MARK: - CONFIGURATOR -

protocol DetailConfiguratorProtocol: class {
    
    func configure(with controller: DetailViewController,
                   and item: Item)
    
}

// MARK: - LAYOUT -

protocol DetailLayoutProtocol: UIView {
    
    var detailsTableView: UITableView! { get set }
    
}

// MARK: - VIEW -

protocol DetailViewProtocol: class {
    
}

// MARK: - INTERACTOR -

protocol DetailInteractorProtocol: class {
    
    var presenter: DetailPresenterProtocol! { get set }
    
    init(presenter: DetailPresenterProtocol)
    
}

// MARK: - PRESENTER -

protocol DetailPresenterProtocol: class {
    
    init(view: DetailViewProtocol, item: Item)
    
    func navigationTitle() -> String
    
    func itemForCell() -> Item
    
}

// MARK: - ROUTER -

protocol DetailRouterProtocol: NavigationProtocol { }


