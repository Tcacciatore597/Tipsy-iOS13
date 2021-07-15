//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Thomas Cacciatore on 7/15/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var splitTotal: String?
    var numberOfPeople: String?
    var tipPercent: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let splitTotal = splitTotal {
            totalLabel.text = splitTotal
        }
        
        if let numberOfPeople = numberOfPeople, let tipPercent = tipPercent {
            settingsLabel.text = "Split between \(numberOfPeople) people with \(tipPercent)% tip."
        }
        
        
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
