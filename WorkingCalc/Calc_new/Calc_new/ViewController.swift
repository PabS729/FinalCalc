//
//  ViewController.swift
//  Calc_new
//
//  Created by Minjing Shi on 2/6/19.
//  Copyright © 2019 Minjing Shi. All rights reserved.
//


import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //TipControl.selectedSegmentIndex = temp
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBOutlet weak var Billfield: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var TotalLabel: UILabel!
    @IBOutlet weak var TipControl: UISegmentedControl!
    @IBOutlet weak var plus: UILabel!
    @IBOutlet weak var equals: UILabel!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    var temp: intmax_t = 0;
    var bkg1: Bool = false
    
    override func viewWillAppear(_ animated: Bool) {
        //var k = SettingsChanged()
        
        TipControl.selectedSegmentIndex = temp
        super.viewDidLoad()
        let s = view.backgroundColor
        if (bkg1) {
            tipLabel.textColor = UIColor.white
            TotalLabel.textColor = UIColor.white
            plus.textColor = UIColor.white
            equals.textColor = UIColor.white
            Billfield.textColor = UIColor.white
            Billfield.backgroundColor = UIColor.black
            TipControl.tintColor = UIColor.white
            view.backgroundColor = UIColor.black
            
        }
            
        else {
            tipLabel.textColor = UIColor.black
            TotalLabel.textColor = UIColor.black
            plus.textColor = UIColor.black
            equals.textColor = UIColor.black
            Billfield.textColor = UIColor.black
            Billfield.backgroundColor = s
            TipControl.tintColor = UIColor.blue
            view.backgroundColor = s
            
        }
        print(bkg1)
    }
    @IBAction func intap(_ sender: Any) {
        //print("Hello")
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        //get the bill
        // calculate tip and total
        
        let bill = Double (Billfield.text!)  ?? 0
        let tippercentage = [0.15, 0.18, 0.2]
        let tip = bill*tippercentage[TipControl.selectedSegmentIndex]
        let total = bill + tip
        tipLabel.text = String(format: "$%.2f", tip)
        TotalLabel.text = String(format: "$%.2f", total)
    }
}

