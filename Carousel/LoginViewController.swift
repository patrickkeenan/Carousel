//
//  LoginViewController.swift
//  Carousel
//
//  Created by Patrick Keenan on 5/30/16.
//  Copyright © 2016 Patrick Keenan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var fieldView: UIView!
    @IBOutlet weak var buttonView: UIView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    var buttonInitialY: CGFloat!
    var buttonOffset: CGFloat!
    var fieldInitialY: CGFloat!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        
        scrollView.contentSize = scrollView.frame.size
        scrollView.contentInset.bottom = 100
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(keyboardWillShow(_:)), name:UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(keyboardWillHide(_:)), name:UIKeyboardWillHideNotification, object: nil)
        buttonInitialY = buttonView.frame.origin.y
        fieldInitialY = fieldView.frame.origin.y

        // Do any additional setup after loading the view.
    }
    @IBAction func backButtonDidTap(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    func keyboardWillShow(notification: NSNotification!) {
        scrollView.contentOffset.y = scrollView.contentInset.bottom
        buttonView.frame.origin.y = buttonInitialY - 120
    }
    @IBAction func didTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        scrollView.contentOffset.y = 0
        buttonView.frame.origin.y = buttonInitialY
    }
    // The scrollView is in the proccess of scrolling...
    func scrollViewDidScroll(scrollView: UIScrollView) {
        print(scrollView.contentOffset.y)
        if scrollView.contentOffset.y <= 80 {
            view.endEditing(true)
        }
    }
    
    @IBAction func attemptSignin(sender: AnyObject) {
        loadingIndicator.stopAnimating()
        delay(2) {
            self.loadingIndicator.stopAnimating()
            self.view.endEditing(true)
            
            if self.emailField.text == "u" && self.passwordField.text == "p" {
                self.performSegueWithIdentifier("loginSegue", sender: nil)
            }else{
                
                let alertController = UIAlertController(title: "Login Failed", message: "The username/password did not match, try again.", preferredStyle: .Alert)
                
                let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
                    
                }
                
                alertController.addAction(cancelAction)
                
                let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
                    
                }
                alertController.addAction(OKAction)
                
                self.presentViewController(alertController, animated: true) {
                    // optional code for what happens after the alert controller has finished presenting
                }
            }
            
        }
        loadingIndicator.startAnimating()
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
