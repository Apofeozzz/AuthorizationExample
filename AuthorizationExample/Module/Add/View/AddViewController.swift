//
//  AddViewController.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 4/26/20.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    
    // MARK: - PRESENTER -
    
    var presenter: AddViewPresenterProtocol!
    
    // MARK: - UIVIEW -
    
    var mainView: AddViewLayoutProtocol!
    
    // MARK: - LIFE CYCLE -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        
    }
    
    deinit {
        print("Add view controller deinit")
    }
    
    // MARK: - ACTION -
    
    @objc private func saveButtonAction() {
        
    }
    
    @objc private func takeAShotButtonAction() {
        
        presenter.takeAShot()
        
    }
    
    @objc private func chooseFromGalleryButtonAction() {
        
        presenter.chooseFromGallery()
        
    }
    
    @objc private func resetPhotoButtonAction() {
        
        mainView.uploadImageView.image = nil
        
        mainView.chooseFromGalleryButton.isHidden = false
        
        mainView.takeAShotButton.isHidden = false
        
        mainView.resetPhotoButton.isHidden = true
        
        
    }
    
    func setUploadedImage(image: UIImage) {
        
        mainView.uploadImageView.image = image
        
        mainView.chooseFromGalleryButton.isHidden = true
        
        mainView.takeAShotButton.isHidden = true
        
        mainView.resetPhotoButton.isHidden = false
        
    }
    
    // MARK: - SETUP VIEW -
    
    private func setupView() {
        
        view.backgroundColor = .mainGreen()
        
        setupNavigationBar()
        
        setupMainView()
        
    }
    
    private func setupNavigationBar() {
        
        guard let navBar = navigationController?.navigationBar else { return }
        
        navBar.isTranslucent = false
        
        navBar.barTintColor = .mainGreen()
        
        navBar.tintColor = .appPlaceholderColor()
        
        let attributes = [NSAttributedString.Key.font: UIFont.futuraBoldWithSize(24),
                          NSAttributedString.Key.foregroundColor: UIColor.mainPink()]
        
        let title = NSAttributedString(string: "Add Screen", attributes: attributes)
        
        let navTitleLabel = UILabel()
            
        navTitleLabel.attributedText = title
        
        navigationItem.titleView = navTitleLabel
        
        let saveButton = UIBarButtonItem(title: "Save",
                                         style: .plain,
                                         target: self,
                                         action: #selector(saveButtonAction))
        
        navigationItem.rightBarButtonItem = saveButton
        
    }
    
    private func setupMainView() {
        
        mainView = AddView()
        
        mainView.rateCollectionView.dataSource = self
        
        mainView.rateCollectionView.delegate = self
        
        mainView.takeAShotButton.addTarget(self,
                                           action: #selector(takeAShotButtonAction),
                                           for: .touchUpInside)
        
        mainView.chooseFromGalleryButton.addTarget(self,
                                                   action: #selector(chooseFromGalleryButtonAction),
                                                   for: .touchUpInside)
        
        mainView.resetPhotoButton.addTarget(self,
                                            action: #selector(resetPhotoButtonAction),
                                            for: .touchUpInside)
        
        view.addSubview(mainView)
        
        setupConstraints()
        
    }
    
    // MARK: - SETUP CONSTRAINTS -
    
    private func setupConstraints() {
        
        view.fillScreenWithSubview(mainView)
        
    }
    
}

extension AddViewController: AddViewProtocol {
    
}

extension AddViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 10
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RateCollectionViewCell.id,
                                                      for: indexPath) as! RateCollectionViewCell
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let size = (UIScreen.main.bounds.width - 50) / 10
        
        return CGSize(width: size, height: size)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        for item in 0...indexPath.row {
         
            let cell = collectionView.cellForItem(at: IndexPath(item: item, section: 0)) as! RateCollectionViewCell
            
            cell.rateImageView.image = UIImage(named: "star_fill")
            
        }
        
        if indexPath.row != 9 {
            
            for item in (indexPath.row + 1)...9 {
                
                let cell = collectionView.cellForItem(at: IndexPath(item: item, section: 0)) as! RateCollectionViewCell
                
                cell.rateImageView.image = UIImage(named: "star_empty")
                
            }
            
        }
        
    }
    
}
