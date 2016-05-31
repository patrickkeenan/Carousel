//
//  SettingsViewController.swift
//  Carousel
//
//  Created by Patrick Keenan on 5/30/16.
//  Copyright © 2016 Patrick Keenan. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = imageView.image!.size
        scrollView.frame.size.height = view.frame.size.height - 64

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func signOutButton(sender: AnyObject) {
        let alertController = UIAlertController(title: "Are you sure you want to log out?", message: "There's no turning back.", preferredStyle: .ActionSheet)
        let logoutAction = UIAlertAction(title: "Log Out", style: .Destructive) { (action) in
            self.performSegueWithIdentifier("segueToLogin", sender: nil)
        }
        alertController.addAction(logoutAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
            // handle case of user canceling. Doing nothing will dismiss the view.
        }
        // add the cancel action to the alert controller
        alertController.addAction(cancelAction)
        presentViewController(alertController, animated: true) {
            // optional code for what happens after the alert controller has finished presenting
        }
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
