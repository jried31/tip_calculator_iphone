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
        
        self.totalLabel.text=String(format:"$%.2f",total);
        
        
        if let val = sender as? UITextField
        {
            if(val.text!.isEmpty){
                if(self.doonce==1){
                //move all fields up 10
                    UIView.animateWithDuration(0.5, animations: {
                        self.tippercentSegment.center.y+=100;
                        self.totalLabel.center.y+=100;
                        self.billTotalField.center.y+=100;
                        self.totalTextLabel.center.y+=100;
                        self.doonce=0;
                        self.totalLabel.alpha=0;
                        self.totalTextLabel.alpha=0;
                    });
                }
                
            }else{
                if(self.doonce==0){
                    if(!val.text!.isEmpty){
                        UIView.animateWithDuration(0.5, animations: {
                            self.totalLabel.alpha=1;
                            self.totalTextLabel.alpha=1;
                
                        //move all fields up 10
                            self.tippercentSegment.center.y-=100;
                            self.totalLabel.center.y-=100;
                            self.billTotalField.center.y-=100;
                            self.totalTextLabel.center.y-=100;
                            self.doonce=1;
                        });
                    }
                }
            }
        }
    
    
        println(self.billTotalField.text);
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true);
    }
    var doonce=0;
    @IBOutlet var tippercentSegment: UISegmentedControl!
    @IBOutlet var totalLabel: UILabel!
    @IBOutlet var billTotalField: UITextField!
    @IBOutlet var totalTextLabel: UILabel!

    override func viewWillAppear(animated: Bool) {
        totalLabel.alpha=0;
        totalTextLabel.alpha=0;
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

