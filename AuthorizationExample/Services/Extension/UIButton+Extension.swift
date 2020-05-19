//
//  UIButton+Extension.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 4/26/20.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import UIKit

extension UIButton {
    
    static func authButton(title: String) -> UIButton {
        
        let button = UIButton(type: .system)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.isUserInteractionEnabled = false
        
        let attributes = [NSAttributedString.Key.font: UIFont.futuraMediumWithSize(20),
                                     NSAttributedString.Key.foregroundColor: UIColor.hexStringToUIColor(hex: "#4D7E8D")]
        
        let title = NSAttributedString(string: title, attributes: attributes)
        
        button.setAttributedTitle(title, for: .normal)
        
        button.backgroundColor = .hexStringToUIColor(hex: "#1D2D31")
        
        button.layer.cornerRadius = 10
        
        return button
        
    }
    
}
