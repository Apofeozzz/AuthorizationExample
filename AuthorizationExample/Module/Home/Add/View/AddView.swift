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
    
    var scrollView:                 UIScrollView!
    
    var contentView:                UIView!
    
    var uploadImageView:            UIImageView!
    
    var takeAShotButton:            UIButton!
    
    var chooseFromGalleryButton:    UIButton!
    
    var resetPhotoButton:           UIButton!
    
    var rateCollectionView:         UICollectionView!
    
    var nameTextField:              UITextField!
    
    var descriptionTextView:        UITextView!
    
    var underView:                  UIView!
    
    var scrollBottomConstraint:     NSLayoutConstraint!
    
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
        
        setupScrollView()
        
        setupContentView()
        
        setupUploadImageView()
        
        setupTakeAShotButton()
        
        setupChooseFromGalleryButton()
        
        setupResetPhotoButton()
        
        setupRateCollectionView()
        
        setupNameTextField()
        
        setupUnderView()
        
        setupDescriptionTextView()
        
        setupConstraints()
        
    }
    
    private func setupScrollView() {
        
        scrollView = UIScrollView()
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(scrollView)
        
    }
    
    private func setupContentView() {
        
        contentView = UIView()
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.addSubview(contentView)
        
    }
    
    private func setupUploadImageView() {
        
        uploadImageView = UIImageView()
        
        uploadImageView.translatesAutoresizingMaskIntoConstraints = false
        
        uploadImageView.layer.borderColor = UIColor.appPlaceholderColor().cgColor
        
        uploadImageView.layer.borderWidth = 1
        
        contentView.addSubview(uploadImageView)
        
    }
    
    private func setupTakeAShotButton() {
        
        takeAShotButton = UIButton(type: .system)
        
        takeAShotButton.translatesAutoresizingMaskIntoConstraints = false
        
        takeAShotButton.setImage(UIImage(named: "camera"), for: .normal)
        
        takeAShotButton.tintColor = .appPlaceholderColor()
        
        contentView.addSubview(takeAShotButton)
        
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
        
        contentView.addSubview(chooseFromGalleryButton)
        
    }
    
    private func setupResetPhotoButton() {
        
        resetPhotoButton = UIButton(type: .system)
        
        resetPhotoButton.translatesAutoresizingMaskIntoConstraints = false
        
        resetPhotoButton.tintColor = .appPlaceholderColor()
        
        let attributes = [NSAttributedString.Key.font: UIFont.futuraMediumWithSize(16),
                          NSAttributedString.Key.foregroundColor: UIColor.appPlaceholderColor()]
        
        let title = NSAttributedString(string: "Reset photo", attributes: attributes)
        
        resetPhotoButton.setAttributedTitle(title, for: .normal)
        
        resetPhotoButton.isHidden = true
        
        contentView.addSubview(resetPhotoButton)
        
    }
    
    private func setupRateCollectionView() {
        
        let layout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = .horizontal
        
        layout.minimumLineSpacing = 1
        
        rateCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        rateCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        rateCollectionView.backgroundColor = .clear
        
        rateCollectionView.register(RateCollectionViewCell.self, forCellWithReuseIdentifier: RateCollectionViewCell.id)
        
        contentView.addSubview(rateCollectionView)
        
    }
    
    private func setupNameTextField() {
        
        nameTextField = UITextField()
        
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        
        nameTextField.font = .futuraMediumWithSize(17)
        
        nameTextField.textColor = .mainPink()
        
        nameTextField.paddingLeftCustom = 5
        
        let placeholderAttributes = [NSAttributedString.Key.font: UIFont.futuraMediumWithSize(16),
                                     NSAttributedString.Key.foregroundColor: UIColor.appPlaceholderColor()]
        
        nameTextField.attributedPlaceholder = NSAttributedString(string: "Enter title",
                                                                 attributes: placeholderAttributes)
        
        contentView.addSubview(nameTextField)
        
    }
    
    private func setupUnderView() {
        
        underView = UIView()
        
        underView.translatesAutoresizingMaskIntoConstraints = false
        
        underView.backgroundColor = .appPlaceholderColor()
        
        contentView.addSubview(underView)
        
    }
    
    private func setupDescriptionTextView() {
        
        descriptionTextView = UITextView()
        
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        
        descriptionTextView.backgroundColor = .clear
        
        descriptionTextView.font = .futuraMediumWithSize(16)
        
        descriptionTextView.textColor = .white
        
        descriptionTextView.layer.cornerRadius = 5
        
        descriptionTextView.layer.borderColor = UIColor.appPlaceholderColor().cgColor
        
        descriptionTextView.layer.borderWidth = 1
        
        contentView.addSubview(descriptionTextView)
        
    }
    
    // MARK: - SETUP CONSTRAINTS -
    
    private func setupConstraints() {
        
        scrollBottomConstraint = scrollView.bottomAnchor.constraint(equalTo: bottomAnchor)
        
        NSLayoutConstraint.activate([
        
            scrollView.topAnchor        .constraint(equalTo: topAnchor),
            scrollBottomConstraint,
            scrollView.leadingAnchor    .constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor   .constraint(equalTo: trailingAnchor)
            
        ])
        
        NSLayoutConstraint.activate([
        
            contentView.topAnchor       .constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor    .constraint(equalTo: scrollView.bottomAnchor),
            contentView.leadingAnchor   .constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor  .constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor     .constraint(equalToConstant: UIScreen.main.bounds.width),
            contentView.heightAnchor    .constraint(equalToConstant: safeScreenHeight())
        
        ])
        
        NSLayoutConstraint.activate([
        
            uploadImageView.topAnchor       .constraint(equalTo: contentView.topAnchor, constant: 5),
            uploadImageView.leadingAnchor   .constraint(equalTo: contentView.leadingAnchor, constant: 20),
            uploadImageView.trailingAnchor  .constraint(equalTo: contentView.trailingAnchor, constant: -20),
            uploadImageView.heightAnchor    .constraint(equalToConstant: UIScreen.main.bounds.width - 40)
        
        ])
        
        NSLayoutConstraint.activate([
        
            takeAShotButton.centerXAnchor   .constraint(equalTo: uploadImageView.centerXAnchor),
            takeAShotButton.centerYAnchor   .constraint(equalTo: uploadImageView.centerYAnchor, constant: -50),
            takeAShotButton.widthAnchor     .constraint(equalToConstant: 100),
            takeAShotButton.heightAnchor    .constraint(equalToConstant: 100)
        
        ])
        
        NSLayoutConstraint.activate([
        
            chooseFromGalleryButton.topAnchor       .constraint(equalTo: takeAShotButton.bottomAnchor),
            chooseFromGalleryButton.centerXAnchor   .constraint(equalTo: takeAShotButton.centerXAnchor)
        
        ])
        
        NSLayoutConstraint.activate([
        
            resetPhotoButton.topAnchor      .constraint(equalTo: uploadImageView.bottomAnchor, constant: 5),
            resetPhotoButton.centerXAnchor  .constraint(equalTo: centerXAnchor)
        
        ])
        
        NSLayoutConstraint.activate([
        
            rateCollectionView.topAnchor        .constraint(equalTo: resetPhotoButton.bottomAnchor),
            rateCollectionView.leadingAnchor    .constraint(equalTo: contentView.leadingAnchor, constant: 20),
            rateCollectionView.trailingAnchor   .constraint(equalTo: contentView.trailingAnchor, constant: -20),
            rateCollectionView.heightAnchor     .constraint(equalToConstant: 50)
        
        ])
        
        NSLayoutConstraint.activate([
        
            nameTextField.topAnchor     .constraint(equalTo: rateCollectionView.bottomAnchor),
            nameTextField.leadingAnchor .constraint(equalTo: contentView.leadingAnchor, constant: 20),
            nameTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            nameTextField.heightAnchor  .constraint(equalToConstant: 40)
        
        ])
        
        NSLayoutConstraint.activate([
        
            underView.topAnchor     .constraint(equalTo: nameTextField.bottomAnchor, constant: 1),
            underView.leadingAnchor .constraint(equalTo: contentView.leadingAnchor, constant: 20),
            underView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            underView.heightAnchor  .constraint(equalToConstant: 1)
        
        ])
        
        NSLayoutConstraint.activate([
        
            descriptionTextView.topAnchor       .constraint(equalTo: underView.bottomAnchor, constant: 5),
            descriptionTextView.leadingAnchor   .constraint(equalTo: contentView.leadingAnchor, constant: 20),
            descriptionTextView.trailingAnchor  .constraint(equalTo: contentView.trailingAnchor, constant: -20),
            descriptionTextView.bottomAnchor    .constraint(equalTo: contentView.bottomAnchor, constant: -5)
        
        ])
        
    }
    
    deinit {
        print("AddView deinit")
    }
    
}
