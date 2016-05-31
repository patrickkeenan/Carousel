//
//  IntroViewController.swift
//  Carousel
//
//  Created by Patrick Keenan on 5/23/16.
//  Copyright © 2016 Patrick Keenan. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var tile1: UIImageView!
    @IBOutlet weak var tile2: UIImageView!
    @IBOutlet weak var tile3: UIImageView!
    @IBOutlet weak var tile4: UIImageView!
    @IBOutlet weak var tile5: UIImageView!
    @IBOutlet weak var tile6: UIImageView!
    
    var yOffsets : [Float] = [-285, -240, -415, -408, -480, -500]
    var xOffsets : [Float] = [-45, 75, 25, 120, -120, -100]
    var scales : [Float] = [1, 1.65, 1.7, 1.6, 1.65, 1.65]
    var rotations : [Float] = [-10, -10, 10, 10, 10, -10]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        scrollView.contentSize = imageView.image!.size
        scrollView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func signIn(sender: AnyObject) {
        
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let tiles = [tile1, tile2, tile3, tile4, tile5, tile6]
        var i = 0
        let offset = scrollView.contentOffset.y
        for tile in tiles{
            print(tile.frame.size.height)
            let tx = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: CGFloat(xOffsets[i]), r2Max: 0)
            let ty = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: CGFloat(yOffsets[i]), r2Max: 0)
            let scale = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: CGFloat(scales[i]), r2Max:1)
            let rotation = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: CGFloat(rotations[i]), r2Max:0)
            print(scale)
            print(offset)
            tile.transform = CGAffineTransformMakeTranslation(tx, ty)
            tile.transform = CGAffineTransformScale(tile.transform, scale, scale)
            tile.transform = CGAffineTransformRotate(tile.transform, rotation * CGFloat(M_PI / 180))
            
            i = i + 1
        }
        
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        print(scrollView.contentOffset.y)
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView,
                                  willDecelerate decelerate: Bool) {
        // This method is called right as the user lifts their finger
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        // This method is called when the scrollview finally stops scrolling.
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
