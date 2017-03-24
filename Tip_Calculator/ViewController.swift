//
//  ViewController.swift
//  Tip_Calculator
//
//  Created by brain sun on 3/7/17.
//  Copyright © 2017 bsun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!

    @IBOutlet weak var tipLabel: UILabel!

    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func OnTap(_ sender: Any) {
        view.endEditing(true)
    }

    @IBAction func CalculateTip(_ sender: AnyObject) {
        let tipPercentage = [0.18, 0.2, 0.25]
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentage[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f",total)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = UserDefaults.standard
        if((defaults.object(forKey: "defaultTipPercentage")) != nil){
            let ret = defaults.object(forKey: "defaultTipPercentage") as! String
            if(ret == "0.25"){
                tipControl.selectedSegmentIndex=2
            }else if(ret == "0.20"){
                tipControl.selectedSegmentIndex=1
            }
            else{
                tipControl.selectedSegmentIndex=0
            }
        }
        
    }
    
}

