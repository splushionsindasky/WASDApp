//
//  ViewController.swift
//  WASDapp
//
//  Created by Alejandro Soto on 16/07/16.
//  Copyright © 2016 ChilaKillers. All rights reserved.
//

import UIKit
import Foundation
import WebKit

class ViewController: UIViewController{
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func viewDidLoad() {

        super.viewDidLoad()
        get_event();
        // Do any additional setup after loading the view, typically from a nib.
    }
    func get_event(){
        let url = NSURL(string: "http://localhost:8888/WASD/get_event.php")
        let data = NSData(contentsOfURL: url!)

    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


