//
//  TableViewController.swift
//  Avito Trainee Problem 2021 Try 2
//
//  Created by Pavel Zykov on 26.10.2022.
//

import UIKit

class TableViewController: UITableViewController {

    var networkManager = NetworkManager()
    var employees = [Employee]()
    var companyName = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkManager.fetchCurrent()
        networkManager.onCompletion = { [weak self] api in
            guard let self = self else { return }
            self.update(api: api)
        }
    }
    
    func update(api: Api) {
        DispatchQueue.main.async {
            self.companyName = api.companyName
            self.employees = api.employees
            self.employees.sort { $0.name < $1.name }
            print("company name is \(self.companyName)")
            print("\(self.employees.count) items here")
            self.tableView.reloadData()
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print("tableview number of row in section is \(employees.count)")
        return employees.isEmpty ? 0 : employees.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("table view cell for row at \(indexPath)")
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        let employee = employees[indexPath.row]

        cell.nameLabel.text = employee.name
        cell.phoneNumberLabel.text = employee.phoneNumber
        cell.skillsLabel.text = employee.skills.joined(separator: ", ")

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
