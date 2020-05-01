//
//  ItemEntity+CoreDataProperties.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 5/1/20.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//
//

import Foundation
import CoreData


extension ItemEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ItemEntity> {
        return NSFetchRequest<ItemEntity>(entityName: "ItemEntity")
    }

    @NSManaged public var image: Data?
    @NSManaged public var rate: Int16
    @NSManaged public var review: String?
    @NSManaged public var title: String?
    @NSManaged public var subcategory: String?
    @NSManaged public var category: String?

}
