//
//  SignUpViewController.swift
//  Tract
//
//  Created by Divine Davis on 11/16/15.
//  Copyright © 2015 Juniper Street. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var detailLabel: UILabel!
  
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var password2TextField: UITextField!
    
    @IBOutlet weak var forgotPasswordLabel: UILabel!
   
    @IBOutlet weak var signInSignUpButton: UIButton!
    
    var signupActive : Bool = true

    @IBOutlet weak var toggleSignUp: UIButton!
    
    @IBAction func forgotPasswordButton(sender: AnyObject) {
        
        passwordTextField.hidden = true
        password2TextField.hidden = true
        signInSignUpButton.setTitle("Send new password", forState: UIControlState.Normal)
        toggleSignUp.hidden = true
    }
    @IBAction func signInSignUpButton(sender: AnyObject) {
        
        if password2TextField.text != passwordTextField.text {
            
            var alert = UIAlertController(title: "Mismatch password", message: "Make sure your passwords match", preferredStyle: UIAlertControllerStyle.Alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            
            self.presentViewController(alert, animated: true, completion: nil)
        }
        
        if emailTextField.text == "" {
            
            var alert = UIAlertController(title: "Email", message: "You did not provide a correct email", preferredStyle: UIAlertControllerStyle.Alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            
            self.presentViewController(alert, animated: true, completion: nil)
    }
        func textFieldShouldReturn(userText: UITextField!) -> Bool {
            userText.resignFirstResponder()
            return true;
        }
    }
    

    @IBAction func toggleSignInSignUpButton(sender: AnyObject) {
        
        if signupActive == true {
            
            signupActive = false
            
            detailLabel.text = "Sign up below"
            signInSignUpButton.setTitle("Log in", forState: UIControlState.Normal)
            
            forgotPasswordLabel.text = "Already a member?"
            signInSignUpButton.setTitle("Sign up", forState: UIControlState.Normal)
            
            toggleSignUp.setTitle("Log in", forState: UIControlState.Normal)
            
            password2TextField.hidden = false
            
            print("Sign up view")
            
        } else {
            
            signupActive = true
            
            detailLabel.text = "Sign in below"
            signInSignUpButton.setTitle("Sign up", forState: UIControlState.Normal)
            
            forgotPasswordLabel.text = "Not a member?"
            
            toggleSignUp.setTitle("Sign up", forState: UIControlState.Normal)
            signInSignUpButton.setTitle("Sign me In!", forState: UIControlState.Normal)
            
            password2TextField.hidden = true
            
            print("Sign in view")
        }
    }
    
    override func viewDidLoad() {
        
        self.view.endEditing(true)
        
        super.viewDidLoad()
        
        self.emailTextField.delegate = self
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
