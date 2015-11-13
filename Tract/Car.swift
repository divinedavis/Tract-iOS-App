//
//  Car.swift
//  Tract
//
//  Created by Divine Davis on 9/19/15.
//  Copyright © 2015 Juniper Street. All rights reserved.
//

import UIKit
typealias ServiceResponse = (JSON, NSError?) -> Void


class Car: NSObject {

    var make : String = ""
    var year : Int = 0
    var model : String = ""
    var tireSize : Int = 0
    var color : String = ""
    var body : String = ""
    
    static let sharedInstance = Car()
    
    let baseURL = "http://api.randomuser.me/"
    
    func getRandomUser(onCompletion: (JSON) -> Void) {
        let route = baseURL
        makeHTTPGetRequest(route, onCompletion: { json, err in
            onCompletion(json as JSON)
        })
    }
    
    func makeHTTPGetRequest(path: String, onCompletion: ServiceResponse) {
        let request = NSMutableURLRequest(URL: NSURL(string: path)!)
        
        let session = NSURLSession.sharedSession()
        
        let task = session.dataTaskWithRequest(request, completionHandler: {data, response, error -> Void in
            let json:JSON = JSON(data: data)
            onCompletion(json, error)
        })
        task.resume()
    }
    
}

