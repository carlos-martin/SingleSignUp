//
//  NewBoostCardViewController.swift
//  SingleSignUp
//
//  Created by Carlos Martin on 04/10/2017.
//  Copyright © 2017 Carlos Martin. All rights reserved.
//

import UIKit

enum BoostSection: Int {
    case passion = 0
    case execution
}

enum BoostRow: Int {
    case header = 0
    case first
    case second
    case third
}

class NewBoostCardViewController: UITableViewController {
    
    var coworker: Coworker?
    var passionIsHidden:   Bool = false
    var executionIsHidden: Bool = false 
    
    var passionOptions: [String] = [
        "Customer focus",
        "Manages ambiguity",
        "Self-development"
    ]
    
    var executionOptions: [String] = [
        "Action oriented",
        "Ensures accountability",
        "Drives results"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let currentSection: BoostSection = BoostSection(rawValue: section)!
        switch currentSection {
        case .passion:
            return (self.passionIsHidden ? 1 : self.passionOptions.count + 1)
        case .execution:
            return (self.executionIsHidden ? 1 : self.executionOptions.count + 1)
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let currentSection: BoostSection = BoostSection(rawValue: section)!
        switch currentSection {
        case .passion:
            return "Passion"
        case .execution:
            return "Execution"
        }
        
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        let row = indexPath.row
        if row == BoostRow.header.rawValue {
            return UITableViewAutomaticDimension
        } else {
            return 44.0
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let row = indexPath.row
        if row == BoostRow.header.rawValue {
            return UITableViewAutomaticDimension
        } else {
            return 44.0
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let section: BoostSection = BoostSection(rawValue: indexPath.section)!
        switch section {
        case .passion:
            self.passionIsHidden = (self.passionIsHidden ? false : true)
            self.tableView.reloadSections(IndexSet(integer: section.rawValue), with: .fade)
        case .execution:
            self.executionIsHidden = (self.executionIsHidden ? false : true)
            self.tableView.reloadSections(IndexSet(integer: section.rawValue), with: .fade)
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section: BoostSection = BoostSection(rawValue: indexPath.section)!
        let row: BoostRow = BoostRow(rawValue: indexPath.row)!
        switch section {
        case .passion:
            switch row {
            case .header:
                let cell = tableView.dequeueReusableCell(withIdentifier: "boostCardHeaderCell", for: indexPath) as! NewBoostHeaderViewCell
                cell.selectionStyle = .none
                cell.backgroundColor = Tools.redPassion
                cell.icon.image = UIImage(named: "passion-big")
                
                let image: UIImage = (self.passionIsHidden ? UIImage(named: "down")! : UIImage(named: "up")!)
                cell.actionButton.setImage(image, for: .normal)
                return cell
            default:
                let cell = tableView.dequeueReusableCell(withIdentifier: "boostCardTypeCell", for: indexPath) as! NewBoostTypeViewCell
                cell.selectionStyle = .gray
                cell.label.text = self.passionOptions[row.rawValue-1]
                return cell
            }
        
        case .execution:
            switch row {
            case .header:
                let cell = tableView.dequeueReusableCell(withIdentifier: "boostCardHeaderCell", for: indexPath) as! NewBoostHeaderViewCell
                cell.selectionStyle = .none
                cell.backgroundColor = Tools.greenExecution
                cell.icon.image = UIImage(named: "execution-big")
                
                let image: UIImage = (self.executionIsHidden ? UIImage(named: "down")! : UIImage(named: "up")!)
                cell.actionButton.setImage(image, for: .normal)
                return cell
            default:
                let cell = tableView.dequeueReusableCell(withIdentifier: "boostCardTypeCell", for: indexPath) as! NewBoostTypeViewCell
                cell.selectionStyle = .gray
                cell.label.text = self.executionOptions[row.rawValue-1]
                return cell
            }
        }
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}