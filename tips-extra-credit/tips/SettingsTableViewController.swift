//
//  SettingsTableViewController.swift
//  tips
//
//  Created by Jried on 8/10/15.
//  Copyright (c) 2015 codepath. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController {
    @IBOutlet var defaultTipPercent: UISegmentedControl!
    @IBOutlet var themeSelectSwitch: UISwitch!
    var defaultTipIndex:Int=1;
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated);
        
        var defaults = NSUserDefaults.standardUserDefaults()
        themeSelectSwitch.setOn(false, animated: false);
        if let themeIndex = defaults.objectForKey("themeIndex") as? Bool
        {
            themeSelectSwitch.setOn(themeIndex, animated: false);
        }
        
        if let tipIndex = defaults.objectForKey("defaultTipIndex") as? Int
        {
            defaultTipPercent.selectedSegmentIndex=tipIndex;
        } else {
            defaultTipPercent.selectedSegmentIndex=defaultTipIndex;//default tip is 20%
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func themeSelectToggle(sender: AnyObject) {
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setBool(self.themeSelectSwitch.on, forKey: "themeIndex");
        defaults.synchronize();
    }
    
    @IBAction func defaultTipChange(sender: AnyObject) {
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(self.defaultTipPercent.selectedSegmentIndex, forKey: "defaultTipIndex");
        defaults.synchronize();
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return 2
    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as! UITableViewCell

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
