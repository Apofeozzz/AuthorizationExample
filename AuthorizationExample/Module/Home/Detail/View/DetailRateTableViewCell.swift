//
//  DetailRateTableViewCell.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 5/2/20.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import UIKit

class DetailRateTableViewCell: UITableViewCell {
    
    static let id = "DetailRateTableViewCell"
    
    // MARK: - UIVIEW -
    
    var rateCollectionView: UICollectionView!
    
    var rateLabel: UILabel!
    
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
        
        setupRateCollectionView()
        
        setupRateLabel()
        
        setupConstraints()
        
    }
    
    private func setupRateCollectionView() {
        
        let layout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = .horizontal
        
        layout.minimumLineSpacing = 1
        
        rateCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        rateCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        rateCollectionView.backgroundColor = .clear
        
        rateCollectionView.register(RateCollectionViewCell.self, forCellWithReuseIdentifier: RateCollectionViewCell.id)
        
        addSubview(rateCollectionView)
        
    }
    
    private func setupRateLabel() {
        
        rateLabel = UILabel()
        
        rateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        rateLabel.textColor = .appPlaceholderColor()
        
        rateLabel.textAlignment = .center
        
        rateLabel.text = "Rate: 0.0"
        
        addSubview(rateLabel)
        
    }
    
    // MARK: - SETUP CONSTRAINTS -
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
        
            rateCollectionView.leadingAnchor    .constraint(equalTo: leadingAnchor,     constant: 20),
            rateCollectionView.trailingAnchor   .constraint(equalTo: trailingAnchor,    constant: -20),
            rateCollectionView.topAnchor        .constraint(equalTo: topAnchor),
            rateCollectionView.heightAnchor     .constraint(equalToConstant: 40)
            
        ])
        
        NSLayoutConstraint.activate([
        
            rateLabel.topAnchor     .constraint(equalTo: rateCollectionView.bottomAnchor, constant: 5),
            rateLabel.leadingAnchor .constraint(equalTo: leadingAnchor,     constant: 20),
            rateLabel.trailingAnchor.constraint(equalTo: trailingAnchor,    constant: -20),
            rateLabel.bottomAnchor  .constraint(equalTo: bottomAnchor,      constant: -5),
            rateLabel.heightAnchor  .constraint(equalToConstant: 20)
        
        ])
        
    }
    
}
