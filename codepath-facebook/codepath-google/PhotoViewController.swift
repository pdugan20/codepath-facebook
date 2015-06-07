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
        photoImageView.frame = framePhoto(photoImageView.image!, inView: photoImageView.superview!)
    }
    
    @IBAction func didPressDoneButton(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func framePhoto(image: UIImage, inView view: UIView) -> CGRect {
        var fromImageSize = image.size
        var aspectRatio: CGFloat = CGFloat(fromImageSize.height / fromImageSize.width)
        var toViewBounds = view.bounds
        var toImageViewWidth = CGRectGetWidth(toViewBounds)
        var toImageViewHeight = toImageViewWidth * aspectRatio
        
        return CGRect(x: 0, y: CGRectGetMidY(toViewBounds) - toImageViewHeight * 0.5, width: toImageViewWidth, height: toImageViewHeight)
    }
    
    // Sets status bar style to either light or dark (default)
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }

}
