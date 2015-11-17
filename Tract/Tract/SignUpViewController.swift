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
    
    var signupActive = true
    
    var forgotPasswordActive = true

    @IBOutlet weak var toggleSignUp: UIButton!
    
    @IBAction func forgotPasswordButton(sender: AnyObject) {
        
        if forgotPasswordActive == true {
            
        passwordTextField.hidden = true
        
        password2TextField.hidden = true
        
        signInSignUpButton.setTitle("Send new password", forState: UIControlState.Normal)
        
        toggleSignUp.setTitle("Go back", forState: UIControlState.Normal)
        } else {
            
            passwordTextField.hidden = false
            
            password2TextField.hidden = false
            
            signInSignUpButton.setTitle("Sign up", forState: UIControlState.Normal)
            
            toggleSignUp.setTitle("Sign in", forState: UIControlState.Normal)
        }
        
    }
    @IBAction func signInSignUpButton(sender: AnyObject) {
        
        if password2TextField.text != passwordTextField.text {
            
            var alert = UIAlertController(title: "Mismatch Password", message: "Make sure your passwords match", preferredStyle: UIAlertControllerStyle.Alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            
            self.presentViewController(alert, animated: true, completion: nil)
        }
        
        if emailTextField.text == "" {
            
            var alert = UIAlertController(title: "Email", message: "You did not provide a correct email", preferredStyle: UIAlertControllerStyle.Alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            
            self.presentViewController(alert, animated: true, completion: nil)
    }
        
    }
    

    @IBAction func toggleSignInSignUpButton(sender: AnyObject) {
        
        if signupActive == true {
            
            signupActive = false
            
            detailLabel.text = "Sign up below"
            signInSignUpButton.setTitle("Log in", forState: UIControlState.Normal)
            
            forgotPasswordLabel.text = "Forgot password?"
            
            signInSignUpButton.setTitle("Sign up", forState: UIControlState.Normal)
            
            toggleSignUp.setTitle("Log in", forState: UIControlState.Normal)
            
            password2TextField.hidden = false
            
            passwordTextField.hidden = false
            
            print("Sign up view")
            
        } else {
            
            signupActive = true
            
            detailLabel.text = "Sign in below"
            
            signInSignUpButton.setTitle("Sign up", forState: UIControlState.Normal)
            
            forgotPasswordLabel.text = "Forgot password?"
            
            toggleSignUp.setTitle("Sign up", forState: UIControlState.Normal)
            
            signInSignUpButton.setTitle("Sign me In!", forState: UIControlState.Normal)
            
            password2TextField.hidden = true
            
            print("Sign in view")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* emailTextField.becomeFirstResponder()
        
        self.emailTextField.delegate = self
        
        textFieldShouldReturn(emailTextField) */
        
    }
    
    // makes the keyboard go away when you touch outside of the text fields
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?){
        
        view.endEditing(true)
        
        super.touchesBegan(touches, withEvent: event)
    }

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        goToPasswordOne()
        
    
        return true
    }
    
    func goToPasswordOne() {
        
        passwordTextField.becomeFirstResponder()
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
