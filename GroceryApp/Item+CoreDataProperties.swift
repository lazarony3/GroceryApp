//
//  Item+CoreDataProperties.swift
//  GroceryApp
//
//  Created by Lazarony, Robert on 12/5/16.
//  Copyright © 2016 Lazarony, Robert. All rights reserved.
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item");
    }

    @NSManaged public var name: String?
    @NSManaged public var quantity: Int16
    @NSManaged public var collection: GroceryList?

}
