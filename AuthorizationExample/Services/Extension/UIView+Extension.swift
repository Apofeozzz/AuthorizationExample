//
//  UIView+Extension.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 18.04.2020.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import UIKit
import Foundation

extension UIView {
	
	func fillScreenWithSubview(_ subview: UIView) {
		
		NSLayoutConstraint.activate([
		
			subview.topAnchor		.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
			subview.leadingAnchor	.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
			subview.trailingAnchor	.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
			subview.bottomAnchor	.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
		
		])
		
	}
	
	func pinToEdgesWithHeight(_ height: CGFloat,
							  top: CGFloat,
							  leading: CGFloat = 0,
							  trailing: CGFloat = 0,
							  view: UIView,
							  subview: UIView) {
		
		NSLayoutConstraint.activate([
		
			subview.topAnchor		.constraint(equalTo: view.topAnchor, constant: top),
			subview.leadingAnchor	.constraint(equalTo: view.leadingAnchor, constant: leading),
			subview.trailingAnchor	.constraint(equalTo: view.trailingAnchor, constant: trailing),
			subview.heightAnchor	.constraint(equalToConstant: height)
		
		])
		
	}
	
}
