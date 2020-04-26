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
    
    func configure(with controller: AddViewController)
    
}

// MARK: - LAYOUT -

protocol AddViewLayoutProtocol: UIView {
    
    var uploadImageView: UIImageView! { get set }
    
    var takeAShotButton: UIButton! { get set }
    
    var chooseFromGalleryButton: UIButton! { get set }
    
    var resetPhotoButton: UIButton! { set get }
    
    var rateCollectionView: UICollectionView! { set get }
    
}

// MARK: - VIEW -

protocol AddViewProtocol: class {
    
    func setUploadedImage(image: UIImage)
    
}

// MARK: - INTERACTOR -

protocol AddViewInteractorProtocol: class {
    
    init(presenter: AddViewPresenterProtocol)
    
    func takePhotoFrom(source: UIImagePickerController.SourceType,
                       router: AddViewRouterProtocol)
    
}

// MARK: - PRESENTER -

protocol AddViewPresenterProtocol: class {
    
    init(view: AddViewProtocol)
    
    func takeAShot()
    
    func chooseFromGallery()
    
    func setUploadedImage(image: UIImage)
    
}

// MARK: - ROUTER -

protocol AddViewRouterProtocol: NavigationProtocol {
    
}
