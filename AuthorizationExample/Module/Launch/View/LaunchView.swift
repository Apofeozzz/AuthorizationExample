//
//  LaunchView.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 18.04.2020.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import UIKit

class LaunchView: UIView {
	
	// MARK: - UIVIEW -
	
	var appNameLabel: UILabel!
	
	var watermarkLabel: UILabel!
	
	// MARK: - INIT -
	
	init() {
		
		super.init(frame: .zero)
		
		translatesAutoresizingMaskIntoConstraints = false
		
		setupView()
		
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: - SETUP VIEW -
	
	private func setupView() {
		
		setupAppNameLabel()
		
		setupWatermarkLabel()
		
		setupConstraints()
		
	}
	
	private func setupAppNameLabel() {
		
		appNameLabel = UILabel()
		
		appNameLabel.translatesAutoresizingMaskIntoConstraints = false
		
		appNameLabel.font = .futuraBoldWithSize(27)
		
		appNameLabel.textColor = .mainPink()
		
		appNameLabel.textAlignment = .center
		
		appNameLabel.text = "Authorization"
		
		addSubview(appNameLabel)
		
	}
	
	private func setupWatermarkLabel() {
		
		watermarkLabel = UILabel()
		
		watermarkLabel.translatesAutoresizingMaskIntoConstraints = false
		
		watermarkLabel.font = .futuraMediumWithSize(14)
		
		watermarkLabel.textColor = .white
		
		watermarkLabel.textAlignment = .center
		
		watermarkLabel.text = "by Denis Grishchenko"
		
		addSubview(watermarkLabel)
		
	}
	
	// MARK: - SETUP CONSTRAINTS -
	
	private func setupConstraints() {
		
		NSLayoutConstraint.activate([
		
			appNameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
			appNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
		
		])
		
		NSLayoutConstraint.activate([
		
			watermarkLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
			watermarkLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
		
		])
		
	}
	
}
