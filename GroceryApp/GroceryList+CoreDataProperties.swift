//
//  GroceryList+CoreDataProperties.swift
//  GroceryApp
//
//  Created by Lazarony, Robert on 12/5/16.
//  Copyright © 2016 Lazarony, Robert. All rights reserved.
//

import Foundation
import CoreData


extension GroceryList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GroceryList> {
        return NSFetchRequest<GroceryList>(entityName: "GroceryList");
    }

    @NSManaged public var name: String?
    @NSManaged public var groceryItems: NSSet?

}

// MARK: Generated accessors for groceryItems
extension GroceryList {

    @objc(addGroceryItemsObject:)
    @NSManaged public func addToGroceryItems(_ value: Item)

    @objc(removeGroceryItemsObject:)
    @NSManaged public func removeFromGroceryItems(_ value: Item)

    @objc(addGroceryItems:)
    @NSManaged public func addToGroceryItems(_ values: NSSet)

    @objc(removeGroceryItems:)
    @NSManaged public func removeFromGroceryItems(_ values: NSSet)

}
