//
//  PhotoViewController.swift
//  codepath-google
//
//  Created by Patrick on 6/5/15.
//  Copyright (c) 2015 dailydoog. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {

    @IBOutlet var photoMainView: UIView!
    @IBOutlet weak var photoImageView: UIImageView!
    
    var weddingPhoto: UIImage!
    
    let mainBgColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.photoMainView.backgroundColor = self.mainBgColor
        
        photoImageView.image = weddingPhoto
        // photoImageView.frame = imageViewFrameForImage(photoImageView.image!, inView: photoImageView.superview!)
        // photosScrollView.contentSize = photoImageView.frame.size
        
    }
    
    @IBAction func didPressDoneButton(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    // Sets status bar style to either light or dark (default)
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }

}
