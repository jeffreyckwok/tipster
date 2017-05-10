//
//  ViewController.swift
//  tipster
//
//  Created by Jeffrey Kwok on 5/9/17.
//  Copyright © 2017 Jeffrey Kwok. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lowTipPercLabel: UILabel!
    @IBOutlet weak var midTipPercLabel: UILabel!
    @IBOutlet weak var highTipPercLabel: UILabel!
    @IBOutlet weak var lowTipAmountLabel: UILabel!
    @IBOutlet weak var midTipAmountLabel: UILabel!
    @IBOutlet weak var highTipAmountLabel: UILabel!
    @IBOutlet weak var lowTipTotalLabel: UILabel!
    @IBOutlet weak var midTipTotalLabel: UILabel!
    @IBOutlet weak var highTipTotalLabel: UILabel!
    
    @IBOutlet weak var inputLabel: UILabel!
    @IBOutlet weak var decimalKey: UIButton!

    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var groupSlider: UISlider!
    @IBOutlet weak var groupSizeLabel: UILabel!
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        if inputLabel.text == "0" && sender.tag < 10 {
            inputLabel.text = String(sender.tag)
        } else if inputLabel.text == "0" && sender.tag == 11 {
            inputLabel.text = "0."
            sender.isEnabled = false
            
        } else if sender.tag < 10 {
            if let inputText = inputLabel.text {
                inputLabel.text = inputText + String(sender.tag)
            }
        } else if sender.tag == 11 {
            if let inputText = inputLabel.text {
                inputLabel.text = inputText + "."
                sender.isEnabled = false
            }
        } else if sender.tag == 10 {
            inputLabel.text = "0"
            decimalKey.isEnabled = true
            
        }
        
        calcTip()
        
        
    }
    
    func calcTip() {
        if let inputString = inputLabel.text {
            let input = Double(inputString)
            let tip = Double(round(tipSlider.value*10))
            let group = Double(round(groupSlider.value*20)+1)
            let minimumTip = Double(input!*(tip/100))
            let minPerPerson = (input! + minimumTip)/group
            let mediumTip = Double((input! * (tip + 5))/100)
            let medPerPerson = (input! + mediumTip)/group
            let maximumTip = Double((input! * (tip + 10))/100)
            let maxPerPerson = (input! + maximumTip)/group
            lowTipAmountLabel.text = String(format: "%.2f", minimumTip)
            midTipAmountLabel.text = String(format: "%.2f", mediumTip)
            highTipAmountLabel.text = String(format: "%.2f", maximumTip)
            lowTipTotalLabel.text = String(format: "%.2f", minPerPerson)
            midTipTotalLabel.text = String(format: "%.2f", medPerPerson)
            highTipTotalLabel.text = String(format: "%.2f", maxPerPerson)
        }
    }
    @IBAction func tipSliderCalc(_ sender: UISlider) {
        lowTipPercLabel.text = String(Int(round(tipSlider.value*10))) + "%"
        midTipPercLabel.text = String(Int(round(tipSlider.value*10))+5)+"%"
        highTipPercLabel.text = String(Int(round(tipSlider.value*10))+10)+"%"
        calcTip()
    }
    @IBAction func groupSliderCalc(_ sender: UISlider) {
        groupSizeLabel.text = String(Int(round(groupSlider.value*20)+1))
        calcTip()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

