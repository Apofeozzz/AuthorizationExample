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
                   dataSource: DataSourceServiceProtocol,
                   and item: Item)
    
}

// MARK: - LAYOUT -

protocol DetailLayoutProtocol: UIView {
    
    var detailsTableView: UITableView! { get set }
    
}

// MARK: - VIEW -

protocol DetailViewProtocol: class {
    
    func reloadTableView()
    
}

// MARK: - INTERACTOR -

protocol DetailInteractorProtocol: class {
    
    var presenter: DetailPresenterProtocol! { get set }
    
    var dataSource: DataSourceServiceProtocol { get set }
    
    init(presenter: DetailPresenterProtocol,
         dataSource: DataSourceServiceProtocol)
    
    func fillRateArrayWithEmptyStars() -> [UIImage]
    
    func fillArrayWithRateStars(rate: Int) -> [UIImage]
    
    func updateItem(item: Item) -> Item?
    
}

// MARK: - PRESENTER -

protocol DetailPresenterProtocol: class {
    
    init(view: DetailViewProtocol, item: Item)
    
    func navigationTitle() -> String
    
    func itemForCell() -> Item
    
    func imageForIndex(_ index: Int) -> UIImage
    
    func fillRateArrayWithEmptyStars()
    
    func reviewForCell(_ index: Int) -> String
    
    func setupRate(_ rate: Int)
    
    func addCommentAction()
    
}

// MARK: - ROUTER -

protocol DetailRouterProtocol: NavigationProtocol {
    
    func showCommentController(with dataSource: DataSourceServiceProtocol,
                               and item: Item)
    
}


