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
    var itemCells = ["Buy Damogron", "Get the Starbot", "Find Wagner"]
    let defaults = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let items = defaults.array(forKey: "StoredItemCells") as? [String] {
            itemCells = items
        }
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
        
        cell.textLabel?.text = itemCells[indexPath.row]
        return cell
    }
    
    // On tableview cell click
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
        else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
            
        }
        
        
        
        
        tableView.deselectRow(at: indexPath, animated: true)
    }


    @IBAction func addToDoItemBtn(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add Todoey App", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            self.itemCells.append(textField.text!)
            self.defaults.set(self.itemCells,forKey: "StoredItemCells")
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

