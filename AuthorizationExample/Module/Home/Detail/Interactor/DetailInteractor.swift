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
    
    var dataSource: DataSourceServiceProtocol
    
    // MARK: - INIT -
    
    required init(presenter: DetailPresenterProtocol,
                  dataSource: DataSourceServiceProtocol) {
        
        self.presenter = presenter
        
        self.dataSource = dataSource
        
    }
    
    func updateItem(item: Item) -> Item? {
        
        let items = dataSource.returnData()
        
        let updated = items.first(where: { item.title == $0.title } )
        
        return updated
        
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
