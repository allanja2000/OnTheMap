//
//  LoginViewController.swift
//  OnTheMap
//
//  Created by ALLAN James on 12/1/16.
//  Copyright © 2016 allanjamescom.allanjames. All rights reserved.
//

import Foundation
import UIKit

class LoginViewController : UIViewController {
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    var udacityClient  : UdacityClient!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
}