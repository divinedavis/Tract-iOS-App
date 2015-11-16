//
//  Users.swift
//  Tract
//
//  Created by Divine Davis on 9/19/15.
//  Copyright © 2015 Juniper Street. All rights reserved.
//

import UIKit

class Users: NSObject {

    var userName : String = ""
    var firstName : String = ""
    var lastName : String = ""
    var address : String = ""
    var points : Int = 0
    var age : Int = 0
    var city : String = ""
    var state : String = ""
    var email : String = ""
    
    func fullName (firstName fName : String, lastName lName : String) -> String {
        var fullName = firstName + " " + lastName
        
        return fullName
    }
    
    
    
    
    
}
