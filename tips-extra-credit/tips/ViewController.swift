//
//  ViewController.swift
//  tips
//
//  Created by Jried on 8/5/15.
//  Copyright (c) 2015 codepath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var billTotal:Double = 0.0;
    var tippercent:Double=18;
    var doonce=0;
    var defaultTipIndex:Int=1;
    @IBOutlet var tippercentSegment: UISegmentedControl!
    @IBOutlet var totalLabel: UILabel!
    @IBOutlet var billTotalField: UITextField!
    @IBOutlet var totalTextLabel: UILabel!
    var currencyFormatter:NSNumberFormatter=NSNumberFormatter();
    var tipPercentages=[0.18,0.2,0.22];

    override func viewWillAppear(animated: Bool) {
        billTotalField.placeholder = currencyFormatter.currencySymbol;
        var defaults = NSUserDefaults.standardUserDefaults()
        if let total = defaults.objectForKey("billTotal") as? Double
        {
            if(total > 0){
                billTotalField.text=String(format:"%.02f", total);
            }
        }
        self.view.backgroundColor=UIColor.grayColor();
        if let theme = defaults.objectForKey("themeIndex") as? Bool{
            if(theme){
                self.view.backgroundColor=UIColor.greenColor();
            }
        }
        updateView();
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        //save input
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setDouble(billTotal, forKey: "billTotal");
        defaults.synchronize()
        
        println("view will disappear")
    }
    
    func updateView(){
        var defaults = NSUserDefaults.standardUserDefaults()
        if(!billTotalField.text.isEmpty)
        {
            billTotal = NSString(string:billTotalField.text).doubleValue;
            if (tippercentSegment.selectedSegmentIndex == -1){
                //no tip % selected on main screen. adopt default tip %
                if let tipPercentIdx = defaults.objectForKey("defaultTipIndex") as? Int
                {//Pull from Settings configuration
                    tippercent = self.tipPercentages[tipPercentIdx];
                    tippercentSegment.selectedSegmentIndex=tipPercentIdx;
                }else{
                    //Adopt application default
                    tippercent = self.tipPercentages[defaultTipIndex];
                    tippercentSegment.selectedSegmentIndex=defaultTipIndex;
                }
            }else{
                tippercent=tipPercentages[tippercentSegment.selectedSegmentIndex];
            }
            
            var tip = billTotal*tippercent;
            var val:Double=billTotal+tip;
            
            //self.totalLabel.text=String(format:"$%.2f",billTotal+tip);
            var formatter = NSNumberFormatter()
            formatter.numberStyle = .CurrencyStyle
            
            totalLabel.text = formatter.stringFromNumber(billTotal+tip)!;
            
            if(self.doonce==0){
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
        }else
        {
            billTotal=0;
            self.totalLabel.alpha=0;
            self.totalTextLabel.alpha=0;
            //Empty text so hide view
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
        }
    }
    
    @IBAction func onEditingChanged(sender: AnyObject) {
        updateView();
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true);
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tippercentSegment.selectedSegmentIndex = -1;
        billTotalField.becomeFirstResponder();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

