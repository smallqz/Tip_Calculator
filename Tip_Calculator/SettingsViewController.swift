//
//  SettingsViewController.swift
//  Tip_Calculator
//
//  Created by xiaoqin zhou on 3/10/17.
//  Copyright © 2017 smallqz. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
    @IBOutlet weak var Label: UILabel!
    
    @IBOutlet weak var ConfirmAndReturn: UIButton!
    @IBOutlet weak var tipPercentage: UIPickerView!

    let pickerDataSource = ["","18%","20%","25%"]
    override func viewDidLoad() {
        super.viewDidLoad()
        tipPercentage.dataSource = self
        tipPercentage.delegate = self
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerDataSource.count;
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerDataSource[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        let defaults = UserDefaults.standard
        var tip = "0.18"
        if((defaults.object(forKey: "defaultTipPercentage")) != nil){
            tip = defaults.object(forKey: "defaultTipPercentage") as! String
        }
        if( row == 1 ){
            tip = "0.18"
        }
        else if(row == 2 ){
            tip = "0.20"
        }else if( row == 3){
            tip = "0.25"
        }
        defaults.set(tip, forKey: "defaultTipPercentage")
        defaults.synchronize()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
