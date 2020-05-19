//
//  ItemEntity+CoreDataProperties.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 5/2/20.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//
//

import Foundation
import CoreData


extension ItemEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ItemEntity> {
        return NSFetchRequest<ItemEntity>(entityName: "ItemEntity")
    }

    @NSManaged public var category: String?
    @NSManaged public var image: Data?
    @NSManaged public var rate: Int16
    @NSManaged public var review: Data?
    @NSManaged public var subcategory: String?
    @NSManaged public var title: String?

}
