//
//  SettingsViewController.swift
//  Calc_new
//
//  Created by Minjing Shi on 2/6/19.
//  Copyright © 2019 Minjing Shi. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.title = "Calculator"
        //UserDefaults.standard.set(CHANGETHEME.isOn, forKey: "enabled")
        // Do any additional setup after loading the view.
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        
        Box.selectedSegmentIndex = tiplabel.integer(forKey: "first");
        //settingsChanged.set(true, forKey: "defaulttip")
        
        
        
        // This is a good place to retrieve the default tip percentage from UserDefaults
        // and use it to update the tip amount
        CHANGETHEME.isOn = defaultColor.bool(forKey: "enabled")
        let k = CHANGETHEME.isOn;
        if (k) {
            view.backgroundColor = UIColor.black
            TipLabell.textColor = UIColor.white
            ThemeLabel.textColor = UIColor.white
            Box.tintColor = UIColor.white
            
            //SettingsChanged.init(ThemeChanged: true, DefaultTipAmount: Box.selectedSegmentIndex)
            
        }
            
        else {
            view.backgroundColor = UIColor.white
            TipLabell.textColor = UIColor.black
            ThemeLabel.textColor = UIColor.black
            Box.tintColor = UIColor.blue
            settingsChanged.set(false, forKey: "bkg")
            //SettingsChanged.init(ThemeChanged: false, DefaultTipAmount: Box.selectedSegmentIndex)
        }
        
        
    }
    
    //override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        //if let vss = segue.destination as? UINavigationController {
            //if segue.destination is ViewController{
                

                
            //}
            
            
        //}
            
        
       
    //}
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did disappear")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    let settingsChanged = UserDefaults.standard
    
    let tiplabel = UserDefaults.standard
    @IBOutlet weak var Box: UISegmentedControl!
    @IBAction func ChangeDefaulttIP(_ sender: Any) {

        tiplabel.set(Box.selectedSegmentIndex, forKey: "first")

        tiplabel.synchronize()
        
    }

    
    @IBOutlet weak var CHANGETHEME: UISwitch!
    @IBOutlet weak var TipLabell: UILabel!

    
    
    @IBOutlet weak var ThemeLabel: UILabel!
    
    let defaultColor = UserDefaults.standard;
    @IBAction func ChangeToDark(_ sender: Any) {
        
        
        if (CHANGETHEME.isOn) {
            defaultColor.set(true, forKey: "enabled")
            defaultColor.synchronize()
            view.backgroundColor = UIColor.black
            TipLabell.textColor = UIColor.white
            ThemeLabel.textColor = UIColor.white
            Box.tintColor = UIColor.white
            //performSegue(withIdentifier: "OK", sender: self)
            
        }
        
        else {
            defaultColor.set(false, forKey: "enabled")
            defaultColor.synchronize()
            view.backgroundColor = UIColor.white
            TipLabell.textColor = UIColor.black
            ThemeLabel.textColor = UIColor.black
            Box.tintColor = UIColor.blue
            
        }
        //self.performSegue(withIdentifier: "OK", sender: self)
        
    }
    
    

    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
   
    @IBOutlet weak var Back: UINavigationItem!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let vc = segue.destination as! ViewController
        vc.temp = self.tiplabel.integer(forKey: "first")
        let vs = segue.destination as! ViewController
        vs.bkg1 = self.defaultColor.bool(forKey: "enabled")
    }
 

}
