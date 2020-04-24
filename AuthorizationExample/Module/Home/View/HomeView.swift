//
//  HomeView.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 4/24/20.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import UIKit

class HomeView: UIView {
    
    // MARK: - UIVIEW -
    
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
        
        setupConstraints()
        
    }
    
    // MARK: - SETUP CONSTRAINTS -
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            
        
        ])
        
    }
    
}
