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
        
        setupKeyboardNotification()
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        presenter.fillRateArrayWithEmptyStars()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        
        NotificationCenter.default.removeObserver(self)
        
    }
    
    deinit {
        print("Add view controller deinit")
    }
    
    // MARK: - ACTION -
    
    @objc private func saveButtonAction() {
        
        presenter.save(image: mainView.uploadImageView.image,
                       title: mainView.nameTextField.text,
                       description: mainView.descriptionTextView.text)
        
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
    
    // MARK: - HANDLE KEYBOARD APPEARANCE -
    
    private func setupKeyboardNotification() {
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
        
    }
    
    @objc func keyboardWillShow(notification: Notification) {
        
        guard let userInfo = notification.userInfo,
        let keyboardSize = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue,
        let duration: TimeInterval = (userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue else { return }
        
        mainView.scrollBottomConstraint.constant = -keyboardSize.height
        
        UIView.animate(withDuration: duration) {
            self.view.layoutIfNeeded()
        }
        
    }
    
    @objc func keyboardWillHide(notification: Notification) {
        
        guard let userInfo          = notification.userInfo,
        let duration: TimeInterval  = (userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue else { return }
        
        mainView.scrollBottomConstraint.constant = 0
        
        UIView.animate(withDuration: duration) {
            self.view.layoutIfNeeded()
        }
    }
    
}

extension AddViewController: AddViewProtocol {
    
    func reloadRateView() {
        
        DispatchQueue.main.async { [weak self] in
            
            guard let ss = self else { return }
            
            ss.mainView.rateCollectionView.reloadData()
            
        }

    }
    
}

extension AddViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 10
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RateCollectionViewCell.id,
                                                      for: indexPath) as! RateCollectionViewCell
        
        cell.rateImageView.image = presenter.imageForIndex(indexPath.row)
       
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let size = (UIScreen.main.bounds.width - 50) / 10
        
        return CGSize(width: size, height: size)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        presenter.setupRate(indexPath.row)
        
    }
    
}
