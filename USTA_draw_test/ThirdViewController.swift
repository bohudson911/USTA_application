//
//  SecondViewController.swift
//  USTA_draw_test
//
//  Created by Robert Hudson on 11/18/15.
//  Copyright © 2015 hudson. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    
    @IBOutlet weak var viaSegNameLabel: UILabel!
    @IBOutlet weak var viaSegHometownLabel: UILabel!
    @IBOutlet weak var viaSegDistrictLabel: UILabel!
    @IBOutlet weak var viaSegSLineLabel: UILabel!
    @IBOutlet weak var viaSegSSeedLabel: UILabel!
    @IBOutlet weak var viaSegDLineLabel: UILabel!
    @IBOutlet weak var viaSegDSeedLabel: UILabel!

    
    
    var viaSegName = ""
    var viaSegHometown = ""
    var viaSegDistrict = ""
    var viaSegSLine = ""
    var viaSegSSeed = ""
    var viaSegDLine = ""
    var viaSegDSeed = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viaSegNameLabel.text = viaSegName
        viaSegHometownLabel.text = "Hometown: \(viaSegHometown)"
        viaSegDistrictLabel.text = "Distric: \(viaSegDistrict)"
        viaSegSLineLabel.text = "Singles Line: \(viaSegSLine)"
        viaSegSSeedLabel.text = "Singles Seed: \(viaSegSSeed)"
        viaSegDLineLabel.text = "Doubles Line: \(viaSegDLine)"
        viaSegDSeedLabel.text = "Doubles Seed: \(viaSegDSeed)"
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
