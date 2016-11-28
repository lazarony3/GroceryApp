//
//  MyData+CoreDataProperties.swift
//  GroceryApp
//
//  Created by Lazarony, Robert on 11/27/16.
//  Copyright © 2016 Lazarony, Robert. All rights reserved.
//

import Foundation
import CoreData

extension MyData {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<MyData> {
        return NSFetchRequest<MyData>(entityName: "MyData");
    }
    
    @NSManaged public var name: String
    @NSManaged public var quantity: Int16
    @NSManaged public var collection: Collection?
    
}
