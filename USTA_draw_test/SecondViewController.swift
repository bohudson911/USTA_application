//
//  SecondViewController.swift
//  USTA_draw_test
//
//  Created by Robert Hudson on 11/18/15.
//  Copyright © 2015 hudson. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {


    @IBOutlet weak var viaSegNameLabel: UILabel!
    var viaSegName = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viaSegNameLabel.text = viaSegName
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
