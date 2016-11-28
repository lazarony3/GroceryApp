//
//  AddCollectionViewController.swift
//  GroceryApp
//
//  Created by Lazarony, Robert on 11/27/16.
//  Copyright © 2016 Lazarony, Robert. All rights reserved.
//

import UIKit

class AddCollectionViewController: UIViewController {

    @IBOutlet var nameField: UITextField?
    
    var manager = DataManager.shared
    
    @IBAction func add() {
        try? manager.create(collectionNamed: nameField?.text)
        dismiss(animated: UIView.areAnimationsEnabled, completion: nil)
    }
}
