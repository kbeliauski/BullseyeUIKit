//
//  HighScoresTableViewController.swift
//  BullseyeUIKit
//
//  Created by Kiryl Beliauski on 7/6/20.
//  Copyright © 2020 Kiryl Beliauski. All rights reserved.
//

import UIKit

class HighScoresTableViewController: UITableViewController {

    var items = [HighScoreItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        items = PersistencyHelper.loadHighScores()
        if (items.count == 0) {
            resetHighScore()
        }
    }
    
    //MARK: - ACTIONs
    
    @IBAction func resetHighScore() {
        items = [HighScoreItem]()
        let item1 = HighScoreItem()
        item1.name = "The reader of this book"
        item1.score = 50000
        items.append(item1)
        
        let item2 = HighScoreItem()
        item2.name = "Manda"
        item2.score = 10000
        items.append(item2)
        
        let item3 = HighScoreItem()
        item3.name = "Joey"
        item3.score = 5000
        items.append(item3)
        
        let item4 = HighScoreItem()
        item4.name = "Adam"
        item4.score = 1000
        items.append(item4)
        
        let item5 = HighScoreItem()
        item5.name = "Eli"
        item5.score = 500
        items.append(item5)
        tableView.reloadData()
        PersistencyHelper.saveHighScores(items)
    }
    
    //MARK: - Table View Delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            items.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            PersistencyHelper.saveHighScores(items)
        }
    }
    

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HighScoreItem", for: indexPath)
        
        let item = items[indexPath.row]
        
        let nameLabel = cell.viewWithTag(1000) as! UILabel
        let scoreLabel = cell.viewWithTag(2000) as! UILabel
        
        nameLabel.text = item.name
        scoreLabel.text = String(item.score)
        
        return cell
    }

}
