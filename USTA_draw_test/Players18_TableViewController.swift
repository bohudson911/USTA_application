//
//  First_TableViewController.swift
//  USTA_draw_test
//
//  Created by Robert Hudson on 11/11/15.
//  Copyright © 2015 hudson. All rights reserved.
//

import UIKit

var tableview_18players: UITableView!

class Players18_TableViewController: UITableViewController {
    
    var json_data_url = "http://146.113.73.80/ios_connection/18_players.php"
    
    var TableData:Array< datastruct > = Array < datastruct >()
    
    
    
    struct datastruct
    {
        var name:String?
        var division:String?
        var origin:String?
        var district:String?
        var singles_line:String?
        var singles_seed:String?
        var doubles_line:String?
        var doubles_seed:String?
        
        
        init(add: NSDictionary)
        {
            name = add["name"] as? String
            division = add["division"] as? String
            origin = add["origin"] as? String
            district = add["district"] as? String
            singles_line = add["singles_line"] as? String
            singles_seed = add["singles_seed"] as? String
            doubles_line = add["doubles_line"] as? String
            doubles_seed = add["doubles_seed"] as? String
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //var nib = UINib(nibName: "viewCustomCell", bundle: nil)
        //tableView.registerNib(nib, forCellReuseIdentifier: "cell")
        
        tableView.layoutMargins = UIEdgeInsetsZero
        tableView.separatorInset = UIEdgeInsetsZero
        get_data_from_url(json_data_url)
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    
    
    func get_data_from_url(url:String){
        print(url)
        let url:NSURL = NSURL(string:url)!
        let session = NSURLSession.sharedSession()
        
        let request = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "GET"
        request.cachePolicy = NSURLRequestCachePolicy.ReloadIgnoringCacheData
        
        let task = session.dataTaskWithRequest(request) {
            (
            let data, let response, let error) in
            
            guard let _:NSData = data, let _:NSURLResponse = response  where error == nil else {
                print("error = \(error)")
                print("error 2")
                return
            }
            
            dispatch_async(dispatch_get_main_queue(), {
                let json = NSString(data: data!, encoding: NSASCIIStringEncoding)
                print ("json object should print")
                //print(json)
                print ("printed")
                self.extract_json(json!)
                return
            })
        }
        print("json")
        task.resume()
    }
    
    
    func extract_json(data:NSString){
        print("starting extract json")
        var parseError: NSError?
        let jsonData:NSData = data.dataUsingEncoding(NSASCIIStringEncoding)!
        let json: AnyObject?
        do {
            json = try NSJSONSerialization.JSONObjectWithData(jsonData, options: [])
        } catch let error as NSError {
            parseError = error
            json = nil
        }
        print("parse error \(parseError)")
        if (parseError == nil)
        {
            if let dict = json as? [String:AnyObject]
            {
                if let players = dict["players"] as? [AnyObject]
                {
                    for dict2 in players
                    {
                        print(dict2)
                        TableData.append(datastruct(add: dict2 as! NSDictionary))
                    }
                }
                do_table_refresh()
            }
            
            //            if let list_dict = json as? NSArray
            //            {
            //                print("this is happening")
            //                for (var i = 0; i < list_dict.count ; i++ )
            //                {
            //                    print("hello")
            //                    if let data_block = list_dict[i] as? NSDictionary
            //                    {
            //                        print(i)
            //                        print(list_dict[i])
            //                        TableData.append(datastruct(add: data_block))
            //                    }
            //                }
            //            }
        }
    }
    
    
    
    
    func do_table_refresh()
    {
        dispatch_async(dispatch_get_main_queue(), {
            self.tableView.reloadData()
            return
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return TableData.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let data = TableData[indexPath.row]

        
        // Configure the cell...
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        cell.textLabel?.text = data.name
        cell.layoutMargins = UIEdgeInsetsZero
        return cell
    }
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return false if you do not want the specified item to be editable.
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
    // Return false if you do not want the item to be re-orderable.
    return true
    }
    */
    
    
     //MARK: - Navigation
    
     //In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SendDataSegue"{
            if let destination = segue.destinationViewController as? SecondViewController{
                let path = tableView.indexPathForSelectedRow
                let cell = tableView.cellForRowAtIndexPath(path!)
                destination.viaSegName = (cell?.textLabel?.text!)!
                if let indexPath = tableView.indexPathForSelectedRow{
                    var row = indexPath.row
                    let data = TableData[indexPath.row]
                    destination.viaSegHometown = data.origin!
                    destination.viaSegDistrict = data.district!
                    destination.viaSegSLine = data.singles_line!
                    destination.viaSegSSeed = data.singles_seed!
                    destination.viaSegDLine = data.doubles_line!
                    destination.viaSegDSeed = data.doubles_seed!
                }
                
                //destination.viaSegHometown =
            }
        }
     //Get the new view controller using segue.destinationViewController.
     //Pass the selected object to the new view controller.
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        _ = tableView.indexPathForSelectedRow!
        if let _ = tableView.cellForRowAtIndexPath(indexPath){
            self.performSegueWithIdentifier("SendDataSegue", sender: self)
        }
    }
    
    
}
