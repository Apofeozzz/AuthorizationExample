//
//  ImagePickerService.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 4/26/20.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import UIKit

class ImagePickerService: NSObject, ImagePickerServiceProtocol {
    
    // MARK: - DATA SOURCE -
    
    var imagePicker: UIImagePickerController!
    
    var router: AddViewRouterProtocol!
    
    var completion: ((UIImage) -> Void)?
    
    // MARK: - INIT -
    
    required init(router: AddViewRouterProtocol, completion: @escaping (UIImage) -> Void) {
        super.init()
        
        self.router = router
        
        self.completion = completion
        
        imagePicker = UIImagePickerController()
        
        imagePicker.delegate = self
        
        imagePicker.allowsEditing = true
        
    }
    
    // MARK: - ACTION -
    
    func openPicker(with sourceType: UIImagePickerController.SourceType) {
        
        if UIImagePickerController.isSourceTypeAvailable(sourceType) {
            
            imagePicker.sourceType = sourceType
            
            router.presentController(imagePicker)
            
        }
        
    }
    
    deinit {
        print("Image picker service was destroyed!")
    }
    
}

// MARK: - DELEGATE -

extension ImagePickerService: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        router.dismissController()
        
        guard let image = info[.editedImage] as? UIImage else { return }
        
        completion!(image)
        
    }
    
}
