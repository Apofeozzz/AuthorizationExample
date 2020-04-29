//
//  VineEntity+CoreDataProperties.swift
//  AuthorizationExample
//
//  Created by Denis Grishchenko on 4/29/20.
//  Copyright © 2020 Denis Grishchenko. All rights reserved.
//
//

import Foundation
import CoreData


extension VineEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<VineEntity> {
        return NSFetchRequest<VineEntity>(entityName: "VineEntity")
    }

    @NSManaged public var title: String?
    @NSManaged public var review: String?
    @NSManaged public var rate: Int16
    @NSManaged public var image: Data?

}
