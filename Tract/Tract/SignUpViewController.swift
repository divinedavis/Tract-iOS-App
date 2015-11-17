//
//  SignUpViewController.swift
//  Tract
//
//  Created by Divine Davis on 11/16/15.
//  Copyright © 2015 Juniper Street. All rights reserved.
//

import UIKit
import Foundation
import Parse

class SignUpViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var detailLabel: UILabel!
  
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var password2TextField: UITextField!
    
    @IBOutlet weak var forgotPasswordLabel: UILabel!
   
    @IBOutlet weak var signInSignUpButton: UIButton!
    
    @IBOutlet weak var toggleSignUp: UIButton!
    
    var signupActive = true
    
    var forgotPasswordActive = true

    var activityIndicator : UIActivityIndicatorView = UIActivityIndicatorView()
    
    var alert = UIAlertController()
    
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
        var error = ""
        
        /* if emailTextField.text == "" || passwordTextField.text == "" {
            
            error = "Please enter a username & password"
        }
        */
        
        if alert != "" {
            
            
            var user = PFUser()
            
            user.username = emailTextField.text
            user.password = passwordTextField.text
            
            activityIndicator = UIActivityIndicatorView(frame: CGRectMake(0, 0, 50, 50))
            activityIndicator.center = self.view.center
            activityIndicator.hidesWhenStopped = true
            activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
            
            view.addSubview(activityIndicator)
            
            activityIndicator.startAnimating()
            
            UIApplication.sharedApplication().beginIgnoringInteractionEvents()
            
            //Checking to see if signupActive is true
            if signupActive == true {
                
                //Since it is true, you'll be able to sign up with this block of code
                user.signUpInBackgroundWithBlock {
                    
                    //Parameters for the block of code
                    (succeeded: Bool, signupError: NSError?) -> Void in
                    
                    //When signupActive is true, the animating circle will stop
                    self.activityIndicator.stopAnimating()
                    
                    //Allow the user to use the interface again
                    UIApplication.sharedApplication().endIgnoringInteractionEvents()
                    
                    //Within this block, while signing up, if signupError doesnt occur, you can sign up
                    if signupError == nil {
                        
                        //Print sign up if you dont receive an error
                        print("signed up")
                        
                    } else {
                        
                        //Creating errorString
                        if let errorString = signupError?.userInfo["error"] as? NSString {
                            
                            //Casting errorString as a Swift object
                            error = errorString as String
                            
                        } else {
                            
                            //Setting the error text
                            error = "Please try again later"
                            
                        }
                        
                        //Display the alert
                    }
                }
                
            } else {
                
                //Saving the username and the password as a PFUser
                PFUser.logInWithUsernameInBackground(emailTextField.text!, password : passwordTextField.text!) {
                    
                    //Creating a block and an in loop
                    (user: PFUser?, signupError: NSError?) -> Void in
                    
                    //Stop the animating circle or 'loading circle'
                    self.activityIndicator.stopAnimating()
                    
                    //Allowing the user to use the interface
                    UIApplication.sharedApplication().endIgnoringInteractionEvents()
                    
                    //If the signupError is not initiated
                    if signupError == nil {
                        
                        //If there is no signupError then it will print "logged in"
                        print("logged in")
                        
                    } else {
                        
                        //Making errorString as an NSString
                        if let errorString = signupError!.userInfo["error"] as? NSString {
                            
                            //Casting error back to String in Swift from Objective C
                            error = errorString as String
                            
                        } else {
                            
                            error = "Please try again later"
                        }
                        
                        self.displayAlert("Could not log in", error: error)
                        
                    }
                }
            }
        }
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
        
        let testObject = PFObject(className: "TestObject")
        testObject["foo"] = "bar"
        testObject.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            println("Object has been saved.")
        }
        
        /* emailTextField.becomeFirstResponder()
        
        self.emailTextField.delegate = self
        
        textFieldShouldReturn(emailTextField) */
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        //If the currentUser is signed in already
        if PFUser.currentUser() != nil {
            
            //Use this segue if the currentUser is logged in
            self.performSegueWithIdentifier("goToTabView", sender: self)
        }
    }
    
    // makes the keyboard go away when you touch outside of the text fields
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?){
        
        view.endEditing(true)
        
        touchesBegan(touches, withEvent: event)
    }

    override func didReceiveMemoryWarning() {
        
        didReceiveMemoryWarning()
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
    
   


