//
//  SecondViewController.swift
//  Tract
//
//  Created by Divine Davis on 9/19/15.
//  Copyright © 2015 Juniper Street. All rights reserved.
//

import UIKit

class HomePage: UIViewController {

    @IBOutlet weak var firstNameLabel: UITextField!
    @IBOutlet weak var lastNameLabel: UITextField!
    @IBOutlet weak var addressLabel: UITextField!
    @IBOutlet weak var cityLabel: UITextField!
    @IBOutlet weak var stateLabel: UITextField!
    @IBOutlet weak var ageLabel: UITextField!
    
    
    var user = Users()


    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var ageIntFromLabel : Int? = Int(ageLabel.text!)
        ageLabel.keyboardType = UIKeyboardType.NumberPad
        

        
        user.firstName = String(firstNameLabel)
        user.lastName = String(lastNameLabel)
        user.address = String(addressLabel)
        user.city = String(cityLabel)
        user.state = String(stateLabel)
        
        
    }
    @IBAction func submitButton(sender: AnyObject) {
        
        print(user.firstName)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }



}

