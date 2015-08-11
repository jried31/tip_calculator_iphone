//
//  SettingsViewController.swift
//  tips
//
//  Created by Jried on 8/10/15.
//  Copyright (c) 2015 codepath. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet var defaultTipPercent: UISegmentedControl!
    var defaultIndex:Int = 1;
    var tipPercentages=[0.18,0.2,0.22];
    
    //Select default tip percent
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated);
        var defaults = NSUserDefaults.standardUserDefaults()
        if let index = defaults.objectForKey("tipPercentIndex") as? Int
        {
            defaultTipPercent.selectedSegmentIndex=index;
        } else {
            defaultTipPercent.selectedSegmentIndex=defaultIndex;
        }
    }
    
    @IBAction func defaultTipChange(sender: AnyObject) {
       var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(self.defaultTipPercent.selectedSegmentIndex, forKey: "tipPercentIndex");
        defaults.synchronize();
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
