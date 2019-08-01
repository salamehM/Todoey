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
    let itemCells = ["Buy Damogron", "Get the Starbot", "Find Wagner"]
    override func viewDidLoad() {
        super.viewDidLoad()
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


}

