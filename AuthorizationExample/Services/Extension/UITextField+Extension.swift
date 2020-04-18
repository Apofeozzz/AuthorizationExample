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
        get {
            return leftView?.frame.size.width ?? 0
        }
        set {
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: newValue, height: frame.size.height))
            leftView = paddingView
            leftViewMode = .always
        }
    }

    @IBInspectable var paddingRightCustom: CGFloat {
        get {
			return rightView?.frame.size.width ?? 0
        }
        set {
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: newValue, height: frame.size.height))
            rightView = paddingView
            rightViewMode = .always
        }
    }
}
