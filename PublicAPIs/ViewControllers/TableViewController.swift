//
//  TableViewController.swift
//  PublicAPIs
//
//  Created by Иван Гришин on 07.10.2021.
//

import UIKit

class TableViewController: UITableViewController {
    
    var publicAPI: PublicAPIs!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 70
        tableView.sectionHeaderHeight = 30
        tableView.sectionHeaderTopPadding = CGFloat(2)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        publicAPI.entries.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        var content = cell.defaultContentConfiguration()
        content.text =
        """
        Description:
        \(publicAPI.entries[indexPath.section].Description ?? "")
        """
        cell.contentConfiguration = content

        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "API: \(publicAPI.entries[section].API ?? "")"
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentAPI = publicAPI.entries[indexPath.section]
        performSegue(withIdentifier: "didSelect", sender: currentAPI)
    }
    

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let infoVC = segue.destination as! InfoViewController
        infoVC.infoAPI = sender as? APIs
    }
//    override func unwind(for unwindSegue: UIStoryboardSegue, towards subsequentVC: UIViewController) {
//
//    }
}
