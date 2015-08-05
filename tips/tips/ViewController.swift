//
//  ViewController.swift
//  tips
//
//  Created by Jried on 8/5/15.
//  Copyright (c) 2015 codepath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func onEditingChanged(sender: AnyObject) {
        var tipPercentages=[0.18,0.2,0.22];
        var tippercent=tipPercentages[self.tippercentSegment.selectedSegmentIndex];
        var billTotal = NSString(string:billTotalField.text).doubleValue;
        
        var tip = billTotal*tippercent;
        var total=billTotal+tip;
        
        self.tipLabel.text="$\(tip)";
        self.totalLabel.text="$\(total)";
        
        self.tipLabel.text=String(format:"$%.2f",tip);self.totalLabel.text=String(format:"$%.2f",total);
        
        println(self.billTotalField.text);
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true);
    }
    @IBOutlet var tippercentSegment: UISegmentedControl!
    @IBOutlet var totalLabel: UILabel!
    @IBOutlet var billTotalField: UITextField!
    @IBOutlet var tipLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

