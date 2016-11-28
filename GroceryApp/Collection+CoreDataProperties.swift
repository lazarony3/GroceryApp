//
//  Collection+CoreDataProperties.swift
//  GroceryApp
//
//  Created by Lazarony, Robert on 11/27/16.
//  Copyright © 2016 Lazarony, Robert. All rights reserved.
//

import Foundation
import CoreData

extension  Collection {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Collection> {
        return NSFetchRequest<Collection>(entityName: "Collection");
    }
    
    @NSManaged public var name: String?
    @NSManaged public var groceryList: NSSet?
    
}


extension Collection {
    @objc(addPeopleObject:)
    @NSManaged public func addToGroceryList(_ value: MyData)
    
    @objc(removePeopleObject:)
    @NSManaged public func removeFromGroceryList(_ value: MyData)
    
    @objc(addPeople:)
    @NSManaged public func addToGroceryList(_ values: NSSet)
    
    @objc (removePeople:)
    @NSManaged public func removeFromGroceryList(_ values: NSSet)
}
