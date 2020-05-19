//
//  DetailRouter.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 5/2/20.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import UIKit

class DetailRouter: DetailRouterProtocol {
    
    weak var controller: UIViewController!
    
    required init(controller: UIViewController) {
        
        self.controller = controller
        
    }
    
    // MARK: - NAVIGATION -
    
    func showCommentController(with dataSource: DataSourceServiceProtocol, and item: Item) {
        
        let commentController = Builder.commentBuilder().commentController(with: dataSource, and: item)
        
        pushController(commentController)
        
    }
    
}
