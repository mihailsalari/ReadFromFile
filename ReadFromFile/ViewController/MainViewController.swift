//
//  MainViewController.swift
//  ReadFromFile
//
//  Created by Mihail Salari on 1/10/17.
//  Copyright © 2017 Mihail Salari. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController {

    // MARK: - Properties
    
    fileprivate var textArray = [String]()
    
    fileprivate struct Constants {
        static let CellIdentifier = "Cell"
        static let DetailSegue = "DetailSegue"
    }
    
    
    // MARK: - LyfeCicle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view/tableView, typically from a nib.
        
        tableView.hideEmptyCells()
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 500
        
        readTextFromFile()
    }
}


// MARK: - Table view data source

extension MainViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return textArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CellIdentifier, for: indexPath)
        
        // Configure the cell...
        cell.textLabel?.text = textArray[indexPath.row]
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.font = UIFont.systemFont(ofSize: 13)
        
        return cell
    }
}


// MARK: - Table view delegate

extension MainViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let textForSender = textArray[indexPath.row]
        self.performSegue(withIdentifier: Constants.DetailSegue, sender: textForSender)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}


// MARK: - Read from file Method

extension MainViewController {
    
    fileprivate func readTextFromFile() {
        if let path = Bundle.main.path(forResource: "test", ofType: "txt") {
            if let text = try? String(contentsOfFile: path) {
                textArray = text.components(separatedBy: "\n\n")
            }
        }
    }
}


// MARK: - Navigation

extension MainViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            switch identifier {
            case Constants.DetailSegue:
                if let viewCntrl = segue.destination.contentViewController as? ViewController, let textFromSender = sender as? String {
                    viewCntrl.text = textFromSender
                }
            default:
                break
            }
        }
    }
}
