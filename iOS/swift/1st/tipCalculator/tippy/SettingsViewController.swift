//
//  SettingsViewController.swift
//  tippy
//
//  Created by Malik, Buland on 3/12/17.
//  Copyright © 2017 Malik, Buland. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTipController: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let defaults = UserDefaults.standard;
        
        print("Default Percentage Index : ",defaults.integer(forKey: "defaultTipControllerSelectedPer"));
        
        //defaultTipController.setEnabled(true, forSegmentAt: defaults.integer(forKey: "defaultTipControllerSelectedPer"));
        
        defaultTipController.selectedSegmentIndex = defaults.integer(forKey: "defaultTipControllerSelectedPer");
        
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

    @IBAction func setDefaultSettings(_ sender: Any) {
        
        /**
         There are several different persistence 
         mechanisms in iOS. The simplest to use is a 
         persistent key-value store called NSUserDefaults. 
         You might use NSUserDefaults for similar purposes 
         as cookies in web development. They can store 
         things like application settings, the current 
         user, or a flag for whether a user has already 
         seen a helpful hints popover.
         -------------
         
         NSUserDefaults has been renamed to UserDefaults. standardUserDefaults() has been renamed to 
         standard() in iOS 10 SDK.
         
         Also setObject/SetInteger... are replcaed with Set(...) fucntions
        */
        let defaults = UserDefaults.standard;
        
        defaults.set(defaultTipController.selectedSegmentIndex, forKey: Constants.DEFAULT_TIPCALC_SELECTED_PERCENTAGE);
        
        //defaults.setObject(defaultTipController.selectedSegmentIndex, forKey: "defaultTipControllerSelectedPer")
        
        //defaults.setInteger(10, forKey: "defaultBillAmount")
        
        /**
         Note the synchronize call. UserDefaults automatically and periodically synchronizes, but
         to manually flush the keys and values to disk, call synchronize to guarantee that your 
         updates are saved.
        */
        defaults.synchronize();
    }
}
