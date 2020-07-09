//
//  EditHighScoreViewController.swift
//  BullseyeUIKit
//
//  Created by Kiryl Beliauski on 7/9/20.
//  Copyright © 2020 Kiryl Beliauski. All rights reserved.
//

import UIKit

class EditHighScoreViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Actions
    
    @IBAction func cancel(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func done(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
