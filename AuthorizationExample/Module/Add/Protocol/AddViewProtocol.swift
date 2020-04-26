//
//  AddViewProtocol.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 4/26/20.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import UIKit

// MARK: - LAYOUT -

protocol AddViewLayoutProtocol: UIView {
    
}

// MARK: - CONFIGURATOR -

protocol AddViewConfiguratorProtocol: class {
    
    func configure(with controller: AddViewController, and view: AddView)
    
}
