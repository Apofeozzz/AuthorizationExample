//
//  HomeViewCell.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 4/27/20.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import UIKit

class HomeViewCell: UITableViewCell {
    
    // MARK: - ID -
    
    static let identifier = "HomeViewCell"
    
    // MARK: - DATA SOURCE -
    
    var vine: Vine? {
        
        willSet { setupData(vine: newValue) }
        
    }
    
    // MARK: - UIVIEW -
    
    var vineImageView: UIImageView!
    
    var titleLabel: UILabel!
    
    var descriptionLabel: UILabel!
    
    var rateLabel: UILabel!
    
    var separateView: UIView!
    
    // MARK: - INIT -
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupData(vine: Vine?) {
        
        guard let vine = vine else { return }
        
        vineImageView.image = vine.image
        
        titleLabel.text = vine.title
        
        descriptionLabel.text = vine.review
        
        rateLabel.text = "\(vine.rate)"
        
    }
    
    // MARK: - SETUP VIEW -
    
    private func setupView() {
        
        selectionStyle = .none
        
        backgroundColor = .clear

        setupVineImageView()
        
        setupTitleLabel()
        
        setupDescriptionLabel()
        
        setupRateLabel()
        
        setupSeparateView()
        
        setupConstraints()
        
    }
    
    private func setupVineImageView() {
        
        vineImageView = UIImageView()
        
        vineImageView.translatesAutoresizingMaskIntoConstraints = false
        
        vineImageView.contentMode = .scaleToFill
        
        vineImageView.layer.cornerRadius = 25
        
        vineImageView.layer.borderColor = UIColor.black.cgColor
        
        vineImageView.layer.borderWidth = 2
        
        vineImageView.clipsToBounds = true
        
        addSubview(vineImageView)
        
    }
    
    private func setupTitleLabel() {
        
        titleLabel = UILabel()
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.font = .futuraMediumWithSize(16)
        
        titleLabel.textColor = .white
        
        addSubview(titleLabel)
        
    }
    
    private func setupDescriptionLabel() {
        
        descriptionLabel = UILabel()
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        descriptionLabel.font = .futuraMediumWithSize(14)
        
        descriptionLabel.textColor = .hexStringToUIColor(hex: "#a8a8a8")
        
        descriptionLabel.numberOfLines = 0
        
        addSubview(descriptionLabel)
        
    }
    
    private func setupRateLabel() {
        
        rateLabel = UILabel()
        
        rateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        rateLabel.font = .futuraBoldWithSize(18)
        
        rateLabel.textColor = .white
        
        rateLabel.textAlignment = .center
        
        addSubview(rateLabel)
        
    }
    
    private func setupSeparateView() {
        
        separateView = UIView()
        
        separateView.translatesAutoresizingMaskIntoConstraints = false
        
        separateView.backgroundColor = .appPlaceholderColor()
        
        addSubview(separateView)
        
    }
    
    // MARK: - SETUP CONSTRAINTS -
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
        
            vineImageView.centerYAnchor .constraint(equalTo: centerYAnchor),
            vineImageView.leadingAnchor .constraint(equalTo: leadingAnchor, constant: 10),
            vineImageView.heightAnchor  .constraint(equalToConstant: 50),
            vineImageView.widthAnchor   .constraint(equalToConstant: 50)
        
        ])
        
        NSLayoutConstraint.activate([
        
            titleLabel.topAnchor        .constraint(equalTo: topAnchor, constant: 15),
            titleLabel.leadingAnchor    .constraint(equalTo: vineImageView.trailingAnchor, constant: 10),
            titleLabel.trailingAnchor   .constraint(equalTo: rateLabel.leadingAnchor, constant: -10)
        
        ])
        
        NSLayoutConstraint.activate([
        
            descriptionLabel.topAnchor      .constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            descriptionLabel.leadingAnchor  .constraint(equalTo: titleLabel.leadingAnchor),
            descriptionLabel.trailingAnchor .constraint(equalTo: titleLabel.trailingAnchor),
            descriptionLabel.bottomAnchor   .constraint(equalTo: bottomAnchor, constant: -15)
            
        ])
        
        NSLayoutConstraint.activate([
        
            rateLabel.centerYAnchor .constraint(equalTo: centerYAnchor),
            rateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            rateLabel.heightAnchor  .constraint(equalToConstant: 30),
            rateLabel.widthAnchor   .constraint(equalToConstant: 30)
        
        ])
        
        NSLayoutConstraint.activate([
        
            separateView.bottomAnchor   .constraint(equalTo: bottomAnchor),
            separateView.leadingAnchor  .constraint(equalTo: leadingAnchor, constant: 16),
            separateView.trailingAnchor .constraint(equalTo: trailingAnchor, constant: -16),
            separateView.heightAnchor   .constraint(equalToConstant: 1)
        
        ])
        
    }
    
}
