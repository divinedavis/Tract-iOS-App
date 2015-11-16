//
//  SignUpViewController.swift
//  Tract
//
//  Created by Divine Davis on 11/16/15.
//  Copyright © 2015 Juniper Street. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!

    @IBOutlet weak var password2TextField: UITextField!
    
    @IBAction func signInSignUpButton(sender: AnyObject) {
        
        self.view.endEditing(true)
        
        if password2TextField.text != passwordTextField.text {
            
            var alert = UIAlertController(title: "Mismatch password", message: "Make sure your passwords match", preferredStyle: UIAlertControllerStyle.Alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            
            self.presentViewController(alert, animated: true, completion: nil)
        }
        
        if ((emailTextField.text?.isEmpty) != nil) {
            
            var alert = UIAlertController(title: "Email", message: "You did not provide a correct email", preferredStyle: UIAlertControllerStyle.Alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            
            self.presentViewController(alert, animated: true, completion: nil)
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.endEditing(true)
        
        super.viewDidLoad()
        
        self.emailTextField.delegate = self
        
        func textFieldShouldReturn(userText: UITextField!) -> Bool {
            userText.resignFirstResponder()
            return true;
        }
        
        
        
        view.resignFirstResponder()
        
       
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
