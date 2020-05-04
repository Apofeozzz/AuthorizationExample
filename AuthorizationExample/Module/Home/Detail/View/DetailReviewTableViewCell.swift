//
//  DetailReviewTableViewCell.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 5/2/20.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import UIKit

class DetailReviewTableViewCell: UITableViewCell {
    
    static let id = "DetailReviewTableViewCell"
    
    // MARK: - UIVIEW -
    
    var reviewLabel: PaddingLabel!
    
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
        
        selectionStyle = .none
        
        setupReviewLabel()
        
        setupConstraints()
        
    }
    
    private func setupReviewLabel() {
        
        reviewLabel = PaddingLabel()
        
        reviewLabel.translatesAutoresizingMaskIntoConstraints = false
        
        reviewLabel.textColor = .appPlaceholderColor()
        
        reviewLabel.layer.cornerRadius = 5

        reviewLabel.layer.borderWidth = 1
        
        reviewLabel.layer.borderColor = UIColor.appPlaceholderColor().cgColor
        
        addSubview(reviewLabel)
        
    }
    
    // MARK: - SETUP CONSTRAINTS -
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
        
            reviewLabel.topAnchor       .constraint(equalTo: topAnchor, constant: 10),
            reviewLabel.bottomAnchor    .constraint(equalTo: bottomAnchor, constant: -10),
            reviewLabel.leadingAnchor   .constraint(equalTo: leadingAnchor, constant: 20),
            reviewLabel.trailingAnchor  .constraint(equalTo: trailingAnchor, constant: -20)
        
        ])
        
    }
    
}
