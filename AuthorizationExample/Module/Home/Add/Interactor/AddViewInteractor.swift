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
    
    var dataSource: DataSourceServiceProtocol!
    
    // MARK: - INIT -
    
    required init(presenter: AddViewPresenterProtocol, dataSource: DataSourceServiceProtocol) {
        
        self.presenter = presenter
        
        self.dataSource = dataSource
        
    }
    
    // MARK: - ACTION -
    
    func takePhotoFrom(source: UIImagePickerController.SourceType, router: AddViewRouterProtocol) {
        
        imagePickerService = ImagePickerService(router: router, completion: { [weak self] (image) in
            
            guard let ss = self else { return }
            
            ss.presenter.setUploadedImage(image: image)
            
        })
        
        imagePickerService.openPicker(with: source)
        
    }
    
    // MARK: - RATE -
    
    func fillRateArrayWithEmptyStars() -> [UIImage] {
        
        var starsArray = [UIImage]()
        
        for _ in 0...9 {
            
            if let emptyStar = UIImage(named: "star_empty") {
                
                starsArray.append(emptyStar)
                
            }
            
        }
        
        return starsArray
        
    }
    
    func fillArrayWithRateStars(rate: Int) -> [UIImage] {
        
        var starsArray = [UIImage]()
        
        for _ in 0...rate {
            
            if let fillStar = UIImage(named: "star_fill") {
                
                starsArray.append(fillStar)
                
            }
            
        }
        
        for _ in rate ..< 9 {
            
            if let emptyStar = UIImage(named: "star_empty") {
                
                starsArray.append(emptyStar)
                
            }
            
        }
        
        return starsArray
        
    }
    
    // MARK: - SAVE -
    
    func createItem(image: UIImage?,
                    title: String?,
                    description: String?,
                    rate: Int) -> CheckForm {
        
        guard let image = image else {
            
            return CheckForm(result: false, message: "Please choose image")
            
        }
        
        guard let title = title else {
            
            return CheckForm(result: false, message: "Please enter title")
            
        }
        
        guard let description = description else {
            
            return CheckForm(result: false, message: "Please enter description")
            
        }
        
        if rate == 0 {
            
          return CheckForm(result: false, message: "Please enter rate")
            
        }
        
        let vine = Vine(image: image, review: description, title: title, rate: rate)
        
        dataSource.appendNewItem(vine)
        
        return CheckForm(result: true)
        
    }
    
    // MARK: - DEINIT -
    
    deinit {
        print("AddViewInteractor destroyed")
    }
    
}
