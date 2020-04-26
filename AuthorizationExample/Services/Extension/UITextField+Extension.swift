//
//  UITextField+Extensions.swift
//  Stitch
//
//  Created by Denis Grishchenko on 16.04.2020.
//  Copyright © 2020 FactorialComplexity. All rights reserved.
//

import UIKit

@IBDesignable
extension UITextField {

    @IBInspectable var paddingLeftCustom: CGFloat {
        
        get { leftView?.frame.size.width ?? 0 }
        
        set {
            
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: newValue, height: frame.size.height))
            
            leftView = paddingView
            
            leftViewMode = .always
            
        }
    }

    @IBInspectable var paddingRightCustom: CGFloat {
        
        get { rightView?.frame.size.width ?? 0 }
        
        set {
            
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: newValue, height: frame.size.height))
            
            rightView = paddingView
            
            rightViewMode = .always
            
        }
    }
    
    static func authTextField(placeholder: String) -> UITextField {
        
        let textField = UITextField()
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        textField.autocapitalizationType = .none
        
        textField.backgroundColor = .hexStringToUIColor(hex: "#1D2D31")
        
        textField.paddingLeftCustom = 10
        
        textField.layer.cornerRadius = 10
        
        textField.textColor = .white
        
        textField.font = .futuraMediumWithSize(17)
        
        let placeholderAttributes = [NSAttributedString.Key.font: UIFont.futuraMediumWithSize(16),
                                     NSAttributedString.Key.foregroundColor: UIColor.hexStringToUIColor(hex: "#4D7E8D")]
        
        textField.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: placeholderAttributes)
        
        return textField
        
    }
    
}
