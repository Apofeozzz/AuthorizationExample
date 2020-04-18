//
//  UIView+Extension.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 18.04.2020.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import UIKit

extension UIView {
	
	func fillScreenWithSubview(_ subview: UIView) {
		
		NSLayoutConstraint.activate([
		
			subview.topAnchor		.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
			subview.leadingAnchor	.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
			subview.trailingAnchor	.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
			subview.bottomAnchor	.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
		
		])
		
	}
	
}
