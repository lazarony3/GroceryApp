//
//  ViewController.swift
//  CoreDataTest
//
//  Created by Downey, Eric on 11/21/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import UIKit

protocol SelectedItemRowContainer {
    var selectedItemIndex: Int? { get set }
}

class CollectionViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var collectionTableView: UITableView?
    
    let manager = DataManager.shared
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        manager.loadCollectioinData()
        collectionTableView?.reloadData()
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return manager.collectionCount
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = manager.getCollectionName(from: indexPath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: UIView.areAnimationsEnabled)
        
        manager.selectedCollectionIndex = indexPath.row
    }
    
    // MARK: - Prepare for Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)

        if var destination = segue.destination as? SelectedItemRowContainer {
            destination.selectedItemIndex = collectionTableView?.indexPathForSelectedRow?.row
        }
    }
}
