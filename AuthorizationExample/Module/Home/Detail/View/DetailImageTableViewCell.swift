//
//  DetailViewCell.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 5/2/20.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import UIKit

class DetailImageTableViewCell: UITableViewCell {
    
    static let id = "DetailImageTableViewCell"
    
    // MARK: - DATA SOURCE -
    
    var item: Item? {
        
        willSet {
            
            itemImageView.image = newValue?.image
            
        }
        
    }
    
    // MARK: - UIVIEW -
    
    var itemImageView: UIImageView!
    
    // MARK: - INIT -
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - SETUP VIEW -
    
    private func setupView() {
        
        backgroundColor = .clear
        
        setupItemImageView()
        
        setupConstraints()
        
    }
    
    private func setupItemImageView() {
        
        itemImageView = UIImageView()
        
        itemImageView.translatesAutoresizingMaskIntoConstraints = false
        
        itemImageView.layer.borderColor = UIColor.appPlaceholderColor().cgColor
        
        itemImageView.layer.borderWidth = 1
        
        addSubview(itemImageView)
        
    }
    
    // MARK: - SETUP CONSTRAINTS -
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
        
            itemImageView.topAnchor         .constraint(equalTo: topAnchor,     constant: 5),
            itemImageView.bottomAnchor      .constraint(equalTo: bottomAnchor,  constant: -5),
            itemImageView.leadingAnchor     .constraint(equalTo: leadingAnchor, constant: 20),
            itemImageView.trailingAnchor    .constraint(equalTo: trailingAnchor, constant: -20),
            itemImageView.heightAnchor      .constraint(equalToConstant: UIScreen.main.bounds.width - 40)
        
        ])
        
    }
    
}
