//
//  ViewController.swift
//  Todoey
//
//  Created by Salameh on 7/29/19.
//  Copyright © 2019 Mhammad Salameh. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController{

    @IBOutlet var theNoteTableView: UITableView!
    var itemCells = [Item]()
    let defaults = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstNewItem = Item()
        firstNewItem.itemName = "First Item"
        itemCells.append(firstNewItem)
        
        let secondNewItem = Item()
        secondNewItem.itemName = "Second Item"
        itemCells.append(secondNewItem)
        
        let thirdNewItem = Item()
        thirdNewItem.itemName = "Third Item"
        itemCells.append(thirdNewItem)
        
//        if let items = defaults.array(forKey: "StoredItemCells") as? [Item] {
//            itemCells = items
//        }
        //theNoteTableView.delegate = self
        // Do any additional setup after loading the view.
        
    }
    // Return the tableview cell count
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemCells.count
        
    }
    
    // Set cell Content
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath)
        
        let item = itemCells[indexPath.row]
        cell.textLabel?.text = item.itemName
        
        cell.accessoryType = item.done ? .checkmark : .none
        
        
        return cell
    }
    
    // On tableview cell click
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        itemCells[indexPath.row].done = !itemCells[indexPath.row].done
        
        tableView.reloadData()
        
//        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
//
//            tableView.cellForRow(at: indexPath)?.accessoryType = .none
//        }
//        else {
//            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
//
//        }
        
        
        
        
        
        
        tableView.deselectRow(at: indexPath, animated: true)
    }


    @IBAction func addToDoItemBtn(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add Todoey App", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            let newItem = Item()
            newItem.itemName = textField.text!
            self.itemCells.append(newItem)
            //self.defaults.set(self.itemCells,forKey: "StoredItemCells")
            self.tableView.reloadData()
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create Item to Add"
            textField = alertTextField
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
}

