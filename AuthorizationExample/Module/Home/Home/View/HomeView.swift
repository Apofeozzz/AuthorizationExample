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
    
    var vineTableView: UITableView!
    
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
        
        setupVineTableView()
        
        setupConstraints()
        
    }
    
    private func setupVineTableView() {
        
        vineTableView = UITableView()
        
        vineTableView.translatesAutoresizingMaskIntoConstraints = false
        
        vineTableView.register(HomeViewCell.self, forCellReuseIdentifier: HomeViewCell.identifier)
        
        vineTableView.separatorStyle = .none
        
        vineTableView.backgroundColor = .clear
        
        addSubview(vineTableView)
        
    }
    
    // MARK: - SETUP CONSTRAINTS -
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            vineTableView.topAnchor     .constraint(equalTo: topAnchor),
            vineTableView.leadingAnchor .constraint(equalTo: leadingAnchor),
            vineTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            vineTableView.bottomAnchor  .constraint(equalTo: bottomAnchor)
        
        ])
        
    }
    
}
