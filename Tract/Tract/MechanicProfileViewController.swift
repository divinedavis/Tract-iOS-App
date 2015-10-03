//
//  MechanicProfileViewController.swift
//  Tract
//
//  Created by Divine Davis on 10/1/15.
//  Copyright © 2015 Juniper Street. All rights reserved.
//

import UIKit

class MechanicProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()


    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

    
    
    - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
    {
    //following lines needed only if you need to send some detail across to ContactViewController
    if ([segue.identifier isEqualToString:@"SegueTestID"]) {
    ContactViewController *destinationViewController = segue.destinationViewController;
    destinationViewController.strTest = @"Check";
    //where strTest is a variable in ContactViewController. i.e:
    //"@property (nonatomic, strong) NSString *strTest;"
    //declared in `ContactViewController.h`
    }
    
    //...
    }

}
