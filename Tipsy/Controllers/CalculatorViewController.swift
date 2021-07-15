//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tipAmount: Double = 0.1
    var stepperValue: Double = 2.0
    var split: String = ""

    @IBAction func tipChanged(_ sender: UIButton) {
        
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        if sender.currentTitle == "0%" {
            zeroPctButton.isSelected = true
            tipAmount = 0.0
        } else if sender.currentTitle == "10%" {
            tenPctButton.isSelected = true
            tipAmount = 0.1
        } else {
            twentyPctButton.isSelected = true
            tipAmount = 0.2
        }
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        stepperValue = sender.value
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        guard let billAmount = billTextField.text, !billAmount.isEmpty else { return }
        guard let bill = Double(billAmount) else { return }
        let tip = bill * tipAmount
        let splitAmount = (bill + tip) / stepperValue
        split = String(format: "%.2f", splitAmount)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ResultSegue" {
            let destinationVC = segue.destination as? ResultsViewController
            let tip = tipAmount * 100
            let tipString = String(format: "%.0f", tip)
            destinationVC?.splitTotal = split
            destinationVC?.numberOfPeople = String(format: "%.0f", stepperValue)
            destinationVC?.tipPercent = tipString
        }
    }
    
}

