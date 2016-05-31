//
//  TimelineViewController.swift
//  Carousel
//
//  Created by Patrick Keenan on 5/30/16.
//  Copyright © 2016 Patrick Keenan. All rights reserved.
//

import UIKit

class TimelineViewController: UIViewController {

    @IBOutlet weak var settingsButton: UIButton!
    @IBOutlet weak var convoButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var scrubber: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = imageView.image!.size
        scrollView.frame.size.height = view.frame.size.height
        scrubber.frame.origin.y = view.frame.size.height - scrubber.frame.size.height
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
