//
//  AddViewProtocol.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 4/26/20.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import UIKit

// MARK: - CONFIGURATOR -

protocol AddViewConfiguratorProtocol: class {
    
    func configure(with controller: AddViewController,
                   dataSource: DataSourceServiceProtocol)
    
}

// MARK: - LAYOUT -

protocol AddViewLayoutProtocol: UIView {
    
    var uploadImageView:            UIImageView!        { get set }
    
    var takeAShotButton:            UIButton!           { get set }
    
    var chooseFromGalleryButton:    UIButton!           { get set }
    
    var resetPhotoButton:           UIButton!           { set get }
    
    var rateCollectionView:         UICollectionView!   { set get }
    
    var nameTextField:              UITextField!        { set get }
    
    var descriptionTextView:        UITextView!         { set get }
    
    var scrollBottomConstraint:     NSLayoutConstraint! { get set }
    
}

// MARK: - VIEW -

protocol AddViewProtocol: class {
    
    func reloadRateView()
    
    func setUploadedImage(image: UIImage)
    
}

// MARK: - INTERACTOR -

protocol AddViewInteractorProtocol: class {
    
    init(presenter: AddViewPresenterProtocol,
         dataSource: DataSourceServiceProtocol)
    
    func takePhotoFrom(source: UIImagePickerController.SourceType,
                       router: AddViewRouterProtocol)
    
    func fillRateArrayWithEmptyStars() -> [UIImage]
    
    func fillArrayWithRateStars(rate: Int) -> [UIImage]
    
    func createItem(image: UIImage?,
                    title: String?,
                    description: String?,
                    rate: Int) -> CheckForm
    
}

// MARK: - PRESENTER -

protocol AddViewPresenterProtocol: class {
    
    init(view: AddViewProtocol)
    
    func takeAShot()
    
    func chooseFromGallery()
    
    func setupRate(_ rate: Int)
    
    func fillRateArrayWithEmptyStars()
    
    func setUploadedImage(image: UIImage)

    func imageForIndex(_ index: Int) -> UIImage
    
    func save(image: UIImage?, title: String?, description: String?)
    
}

// MARK: - ROUTER -

protocol AddViewRouterProtocol: NavigationProtocol {
    
}
