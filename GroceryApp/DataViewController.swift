//
//  DataViewController.swift
//  GroceryApp
//
//  Created by Lazarony, Robert on 11/27/16.
//  Copyright © 2016 Lazarony, Robert. All rights reserved.
//

import UIKit

class DataViewController: UIViewController , UITableViewDataSource, UITableViewDelegate, SelectedItemRowContainer {
    
    @IBOutlet weak var dataTableView: UITableView!
    var selectedItemIndex: Int?
    
    let manager = DataManager.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager.selectedMyDataIndex = selectedItemIndex!
        
        manager.loadMyData()
        dataTableView?.reloadData()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return manager.collectionCount
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Item", for: indexPath)
        let item = manager.getMyData(from: indexPath)
        
        cell.textLabel?.text = item?.name
        cell.detailTextLabel?.text = String(item?.quantity)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: UIView.areAnimationsEnabled)
        
        manager.selectedCollectionIndex = indexPath.row
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
