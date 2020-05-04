//
//  DetailPresenter.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 5/2/20.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//

import UIKit

class DetailPresenter: DetailPresenterProtocol {
    
    // MARK: - DATA SOURCE -
    
    weak var view:  DetailViewProtocol!
    
    var interactor: DetailInteractorProtocol!
    
    var router: DetailRouterProtocol!
    
    var item: Item!
    
    var rateImageArray: [UIImage]!
    
    var rate = 0
    
    // MARK: - INIT -
    
    required init(view: DetailViewProtocol, item: Item) {
        
        self.view = view
        
        self.item = item
        
    }
    
    // MARK: - ACTION -
    
    func navigationTitle() -> String {
        
        item.title
        
    }
    
    func itemForCell() -> Item {
        
        if let updated = interactor.updateItem(item: item) { item = updated }
        
        return item
        
    }
    
    func reviewForCell(_ index: Int) -> String {
        
        item.review[index-2]
        
    }
    
    func addCommentAction() {
        
        moveToCommentController(with: interactor.dataSource,
                                and: item)
        
    }
    
    // MARK: - RATE COLLECTION VIEW -
    
    func fillRateArrayWithEmptyStars() {
        
        rateImageArray = interactor.fillRateArrayWithEmptyStars()
        
    }
    
    func setupRate(_ rate: Int) {
        
        self.rate = rate + 1
        
        rateImageArray = interactor.fillArrayWithRateStars(rate: rate)
        
        view.reloadTableView()
        
    }
    
    func imageForIndex(_ index: Int) -> UIImage {
            
        rateImageArray[index]
            
    }
    
    // MARK: - NAVIGATION -
    
    func moveToCommentController(with dataSource: DataSourceServiceProtocol, and item: Item) {
        
        let commentController = Builder.commentBuilder().commentController(with: dataSource, and: item)
        
        router.pushController(commentController)
        
    }
    
}
