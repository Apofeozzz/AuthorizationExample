//
//  AddViewProtocol.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 4/26/20.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import Foundation
import UIKit

class AddViewPresenter: AddViewPresenterProtocol {
    
    // MARK: - DATA SOURCE -
    
    weak var view: AddViewProtocol!
    
    var interactor: AddViewInteractor!
    
    var router: AddViewRouterProtocol!
    
    // MARK: - INIT -
    
    required init(view: AddViewProtocol) {
        
        self.view = view
        
    }
    
    // MARK: - ACTION -
    
    func takeAShot() {
        
        interactor.takePhotoFrom(source: .camera,
                                 router: router)
        
    }
    
    func chooseFromGallery() {
        
        interactor.takePhotoFrom(source: .photoLibrary,
                                 router: router)
        
    }
    
    func setUploadedImage(image: UIImage) {
        
        view.setUploadedImage(image: image)
        
    }
    
    deinit {
        print("AddViewPresenter deinit")
    }
    
}
