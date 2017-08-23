//
//  StudentTableViewController.swift
//  StudentManager
//
//  Created by Quốc Đạt on 09.08.17.
//  Copyright © 2017 QuocDat. All rights reserved.
//

import UIKit
import os.log

class StudentTableViewController: UITableViewController {
    let dataSource = DataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.leftBarButtonItem = editButtonItem
        
        tableView.dataSource = dataSource
        tableView.delegate = self
        dataSource.studentsTBV = self
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        switch (segue.identifier ?? "" ) {
        case "AddItem":
            os_log("Adding a new student.", log: OSLog.default, type: .debug)
        case "ShowDetail":
            guard let studentDetailViewController = segue.destination as? StudentDetailTableViewController else {return}
            
            guard let selectedStudentCell = sender as? StudentTableViewCell else {return}
            
            guard let indexPath = tableView.indexPath(for: selectedStudentCell) else {return}
            
            let selectedStudent = DataService.shared.students[indexPath.row]
            studentDetailViewController.student = selectedStudent
            
        default:
            fatalError("Unexpected Segue Identifier; \(segue.identifier)")
        }
        
    }
    
    @IBAction func unwindToListStudent ( sender: UIStoryboardSegue) {
        if let sourceTableViewController = sender.source as? StudentDetailTableViewController,
            let student = sourceTableViewController.student {
            
            if let selectedAtIndexPath =  tableView.indexPathForSelectedRow {
                DataService.shared.students[selectedAtIndexPath.row] = student
                tableView.reloadRows(at: [selectedAtIndexPath], with: .none)
            }
            else {
                // ADD a new student
                let newIndexPath = IndexPath(row: DataService.shared.students.count, section: 0)
                DataService.shared.students.append (student)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
                
            }
        }
    }
    
}


