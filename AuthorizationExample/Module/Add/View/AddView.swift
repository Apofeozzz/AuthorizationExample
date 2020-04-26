//
//  AddView.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 4/26/20.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import UIKit

class AddView: UIView, AddViewLayoutProtocol {
    
    // MARK: - UIVIEW -
    
    var uploadImageView: UIImageView!
    
    var takeAShotButton: UIButton!
    
    var chooseFromGalleryButton: UIButton!
    
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
        
        setupUploadImageView()
        
        setupTakeAShotButton()
        
        setupChooseFromGalleryButton()
        
        setupConstraints()
        
    }
    
    private func setupUploadImageView() {
        
        uploadImageView = UIImageView()
        
        uploadImageView.translatesAutoresizingMaskIntoConstraints = false
        
        uploadImageView.layer.borderColor = UIColor.appPlaceholderColor().cgColor
        
        uploadImageView.layer.borderWidth = 1
        
        addSubview(uploadImageView)
        
    }
    
    private func setupTakeAShotButton() {
        
        takeAShotButton = UIButton(type: .system)
        
        takeAShotButton.translatesAutoresizingMaskIntoConstraints = false
        
        takeAShotButton.setImage(UIImage(named: "camera"), for: .normal)
        
        takeAShotButton.tintColor = .appPlaceholderColor()
        
        addSubview(takeAShotButton)
        
    }
    
    private func setupChooseFromGalleryButton() {
        
        chooseFromGalleryButton = UIButton(type: .system)
        
        chooseFromGalleryButton.translatesAutoresizingMaskIntoConstraints = false
        
        let attributes = [NSAttributedString.Key.font: UIFont.futuraMediumWithSize(16),
                          NSAttributedString.Key.foregroundColor: UIColor.appPlaceholderColor()]
        
        let title = NSAttributedString(string: "add from gallery", attributes: attributes)
        
        chooseFromGalleryButton.setAttributedTitle(title, for: .normal)
        
        chooseFromGalleryButton.contentEdgeInsets = UIEdgeInsets(top: 8, left: 10, bottom: 8, right: 10)
        
        chooseFromGalleryButton.layer.cornerRadius = 15
        
        chooseFromGalleryButton.layer.borderColor = UIColor.appPlaceholderColor().cgColor
        
        chooseFromGalleryButton.layer.borderWidth = 1
        
        addSubview(chooseFromGalleryButton)
        
    }
    
    // MARK: - SETUP CONSTRAINTS -
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
        
            uploadImageView.topAnchor       .constraint(equalTo: topAnchor, constant: 20),
            uploadImageView.leadingAnchor   .constraint(equalTo: leadingAnchor, constant: 20),
            uploadImageView.trailingAnchor  .constraint(equalTo: trailingAnchor, constant: -20),
            uploadImageView.heightAnchor    .constraint(equalToConstant: UIScreen.main.bounds.width - 40)
        
        ])
        
        NSLayoutConstraint.activate([
        
            takeAShotButton.centerXAnchor   .constraint(equalTo: uploadImageView.centerXAnchor),
            takeAShotButton.centerYAnchor   .constraint(equalTo: uploadImageView.centerYAnchor, constant: -50),
            takeAShotButton.widthAnchor     .constraint(equalToConstant: 100),
            takeAShotButton.heightAnchor    .constraint(equalToConstant: 100)
        
        ])
        
        NSLayoutConstraint.activate([
        
            chooseFromGalleryButton.topAnchor.constraint(equalTo: takeAShotButton.bottomAnchor),
            chooseFromGalleryButton.centerXAnchor.constraint(equalTo: takeAShotButton.centerXAnchor)
        
        ])
        
    }
    
}
