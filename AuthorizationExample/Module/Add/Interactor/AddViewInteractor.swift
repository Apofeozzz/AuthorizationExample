//
//  AddViewInteractor.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 4/26/20.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import Foundation
import UIKit

protocol ImagePickerServiceProtocol: class {
    
    init(router: AddViewRouterProtocol, completion: @escaping (UIImage) -> Void)
    
    func openPicker(with sourceType: UIImagePickerController.SourceType)
    
}

class AddViewInteractor: AddViewInteractorProtocol {
    
    // MARK: - DATA SOURCE -
    
    weak var presenter: AddViewPresenterProtocol!
    
    var imagePickerService: ImagePickerServiceProtocol!
    
    // MARK: - INIT -
    
    required init(presenter: AddViewPresenterProtocol) {
        
        self.presenter = presenter
        
    }
    
    // MARK: - ACTION -
    
    func takePhotoFrom(source: UIImagePickerController.SourceType, router: AddViewRouterProtocol) {
        
        imagePickerService = ImagePickerService(router: router, completion: { [weak self] (image) in
            
            guard let ss = self else { return }
            
            ss.presenter.setUploadedImage(image: image)
            
        })
        
        imagePickerService.openPicker(with: source)
        
    }
    
    deinit {
        print("AddViewInteractor destroyed")
    }
    
}
