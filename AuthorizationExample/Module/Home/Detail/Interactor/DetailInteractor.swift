//
//  DetailInteractor.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 5/2/20.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import UIKit

class DetailInteractor: DetailInteractorProtocol {
    
    // MARK: - DATA SOURCE -
    
    weak var presenter: DetailPresenterProtocol!
    
    // MARK: - INIT -
    
    required init(presenter: DetailPresenterProtocol) {
        
        self.presenter = presenter
        
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
    
}
