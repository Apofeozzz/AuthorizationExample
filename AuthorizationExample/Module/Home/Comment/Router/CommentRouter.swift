//
//  CommentRouter.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 5/4/20.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import UIKit

class CommentRouter: CommentRouterProtocol {
    
    // MARK: - DATA SOURCE -
    
    weak var controller: UIViewController!
    
    // MARK: - INIT -
    
    required init(controller: UIViewController) {
        
        self.controller = controller
        
    }
    
}
