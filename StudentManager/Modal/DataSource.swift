//
//  DataSource.swift
//  StudentManager
//
//  Created by Quốc Đạt on 22.08.17.
//  Copyright © 2017 QuocDat. All rights reserved.
//

import Foundation
import UIKit
class DataSource: NSObject, UITableViewDataSource {
    // MARK: - Table view data source
    weak var studentsTBV: StudentTableViewController?
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return DataService.shared.students.count
    }
    
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! StudentTableViewCell
        let students = DataService.shared.students[indexPath.row]
        cell.studentNameTextField.text = students.name
        cell.studentImageView.image = students.photo
        cell.IDNameTextField.text =  students.iD
        return cell
    }
     func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    
    
    // Override to support editing the table view.
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            DataService.shared.students.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
}
