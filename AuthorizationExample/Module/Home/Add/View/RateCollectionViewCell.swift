//
//  RateCollectionViewCell.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 4/27/20.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import UIKit

class RateCollectionViewCell: UICollectionViewCell {
    
    static let id = "RateCollectionViewCell"
    
    // MARK: - DATA SOURCE -
    
    // MARK: - UIVIEW -
    
    var rateImageView: UIImageView!
    
    // MARK: - INIT -
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        setupView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - SETUP VIEW -
    
    private func setupView() {
        
        setupRateImageView()
        
        setupConstraints()
        
    }
    
    private func setupRateImageView() {
        
        let emptyStar = UIImage(named: "star_empty")
        
        rateImageView = UIImageView(image: emptyStar)
        
        rateImageView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(rateImageView)
        
    }
    
    // MARK: - SETUP CONSTRAINTS -
    
    private func setupConstraints() {
        
        fillScreenWithSubview(rateImageView)
        
    }
    
}
