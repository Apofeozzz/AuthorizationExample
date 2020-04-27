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
    
    var rate: Int = 0
    
    var rateImageArray: [UIImage]!
    
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
    
    // MARK: - RATE COLLECTION VIEW -
    
    func fillRateArrayWithEmptyStars() {
        
        rateImageArray = interactor.fillRateArrayWithEmptyStars()
        
    }
    
    func setUploadedImage(image: UIImage) {
        
        view.setUploadedImage(image: image)
        
    }
    
    func setupRate(_ rate: Int) {
        
        self.rate = rate + 1
        
        rateImageArray = interactor.fillArrayWithRateStars(rate: rate)
        
        view.reloadRateView()
        
    }
    
    func imageForIndex(_ index: Int) -> UIImage {
            
        rateImageArray[index]
            
    }
    
    // MARK: - SAVE -
    
    func save(image: UIImage?, title: String?, description: String?) {
        
        let check = interactor.createItem(image: image,
                                          title: title,
                                          description: description,
                                          rate: rate)
        
        if !check.result {
            
            if let message = check.message {
                
                router.showAlert(title: check.title,
                                 message: message)
                
                return
                
            }
            
        }
        
        router.popController()
        
    }
    
    // MARK: - DEINIT -
    
    deinit {
        print("AddViewPresenter deinit")
    }
    
}
