//
//  DataManager.swift
//  GroceryApp
//
//  Created by Lazarony, Robert on 11/27/16.
//  Copyright © 2016 Lazarony, Robert. All rights reserved.
//

import CoreData

enum DataError: Error {
    case BadManagedObjectContext(String)
    case BadEntity(String)
}

class DataManager {
    static var shared: DataManager = DataManager()
    
    var managedObjectContext: NSManagedObjectContext?
    var collections: [GroceryList]
    var collectionCount: Int {
        return collections.count
    }
    
    var myData: [Item]
    var myDataCount: Int {
        return myData.count
    }
    
    var selectedCollectionIndex: Int 
    var selectedMyDataIndex: Int
    
    private init() {
        collections = []
        myData = []
        
        selectedCollectionIndex = -1
        selectedMyDataIndex = -1
    }
}

extension DataManager {
    func loadCollectioinData() {
        collections = fetch()
    }
    
    func create(collectionNamed name: String?) throws {
        guard let ctx = managedObjectContext else {
            throw DataError.BadManagedObjectContext("The Managed object was nil")
        }
        guard let entity = NSEntityDescription.entity(forEntityName: "GroceryList", in: ctx) else {
            throw DataError.BadEntity("The entity was bad")
        }
        
        let obj = GroceryList(entity: entity, insertInto: ctx)
        obj.name = name
        
        try? save()
    }
    
    func getCollectionName(from indexPath: IndexPath) -> String? {
        return collections.value(at: indexPath.row)?.name
    }
}

extension DataManager {
    func loadMyData() {
        let selectedCollection = collections.value(at: selectedCollectionIndex)
        myData = selectedCollection?.groceryItems?.flatMap { item in
            return item as? Item
        } ?? []
    }
    
    func create(data: (name: String?, quantity: Int)) throws {
        guard let ctx = managedObjectContext else {
            throw DataError.BadManagedObjectContext("The Managed object was nil")
        }
        guard let entity = NSEntityDescription.entity(forEntityName: "Item", in: ctx) else {
            throw DataError.BadEntity("The entity was bad")
        }
        let obj = Item(entity:entity, insertInto: ctx)
        obj.name = data.name!
        obj.quantity = Int16(data.quantity)
        
        obj.collection = collections.value(at: selectedCollectionIndex)!
        
        try? save()
    }
    
    func getMyData(from indexPath: IndexPath) -> (name: String?, quantity: Int?)? {
        guard let item = myData.value(at: indexPath.row) else {
            return nil
        }
        return (item.name, Int(item.quantity))
    }
    
    func getSelectedMyData() -> (name: String?, quantity: Int?)? {
        guard let item = myData.value(at: selectedMyDataIndex) else {
            return nil
        }
        return (item.name, Int(item.quantity))
    }
}

extension DataManager {
    func fetch<T: NSManagedObject>() -> [T] {
        var result: [T]? = nil
        managedObjectContext?.performAndWait { [weak self] in
            do{
                result = try self?.executeFetchRequest()
            }
            catch {
                print(error)
            }
        }
        return result ?? []
    }
    
    private func executeFetchRequest<T: NSManagedObject>() throws -> [T]? {
        let request = T.fetchRequest()
        return try request.execute() as? [T]
    }
    
    func save() throws {
        try managedObjectContext?.save()
    }
}
