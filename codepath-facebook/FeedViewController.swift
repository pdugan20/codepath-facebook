//
//  FeedViewController.swift
//  codepath-google
//
//  Created by Patrick Dugan on 5/6/15.
//  Copyright (c) 2015 dailydoog. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var feedImageView: UIImageView!
    @IBOutlet var feedMainView: UIView!
    
    var imageTransition: ImageTransition!
    var selectedImageView: UIImageView!
    
    let mainBgColor = UIColor(red: 211/255, green: 214/255, blue: 219/255, alpha: 1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.feedMainView.backgroundColor = self.mainBgColor
        scrollView.contentSize = CGSize(width: 320, height: 1000)
        scrollView.contentSize = feedImageView.image!.size
        
    }
    
    @IBAction func didTapPhoto(sender: UITapGestureRecognizer) {
        selectedImageView = sender.view as! UIImageView
        performSegueWithIdentifier("fullPhotoSegue", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        var photoViewController = segue.destinationViewController as! PhotoViewController
        photoViewController.weddingPhoto = self.selectedImageView.image
        imageTransition = ImageTransition()
        photoViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
        photoViewController.transitioningDelegate = imageTransition
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Sets status bar style to either light or dark (default)
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }

}
