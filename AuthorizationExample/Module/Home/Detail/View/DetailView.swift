//
//  DetailView.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 5/2/20.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import UIKit

class DetailView: UIView, DetailLayoutProtocol {
    
    // MARK: - UIVIEW --
    
    var detailsTableView: UITableView!
    
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
        
        setupDetailsTableView()
        
        setupConstraints()
        
    }
    
    private func setupDetailsTableView() {
        
        detailsTableView = UITableView()
        
        detailsTableView.translatesAutoresizingMaskIntoConstraints = false
        
        detailsTableView.separatorColor = .clear
        
        detailsTableView.backgroundColor = .clear
        
        detailsTableView.register(DetailImageViewCell.self, forCellReuseIdentifier: DetailImageViewCell.id)
        
        addSubview(detailsTableView)
        
    }
    
    private func setupConstraints() {
        
        fillScreenWithSubview(detailsTableView)
        
    }
    
}

