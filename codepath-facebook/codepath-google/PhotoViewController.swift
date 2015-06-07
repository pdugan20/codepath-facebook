//
//  PhotoViewController.swift
//  codepath-google
//
//  Created by Patrick on 6/5/15.
//  Copyright (c) 2015 dailydoog. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet var photoMainView: UIView!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var photoScrollView: UIScrollView!
    @IBOutlet weak var doneButton: UIImageView!
    @IBOutlet weak var footerActionBar: UIImageView!
    @IBOutlet weak var photoFadeView: UIView!
    
    var weddingPhoto: UIImage!
    var isDismissingPhoto: Bool = false
    
    let mainBgColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.photoFadeView.backgroundColor = self.mainBgColor
        photoScrollView.delegate = self
        isDismissingPhoto = false
        
        photoImageView.image = weddingPhoto
        photoImageView.frame = framePhoto(photoImageView.image!, inView: photoImageView.superview!)
        // photoScrollView.contentSize = photoImageView.frame.size
        photoScrollView.contentSize = CGSize(width: 320, height: 1000)
        
    }
    
    // Dismisses photo modal outright
    @IBAction func didPressDoneButton(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    // Properly frames photo inside of UIImageView
    func framePhoto(image: UIImage, inView view: UIView) -> CGRect {
        var fromImageSize = image.size
        var aspectRatio: CGFloat = CGFloat(fromImageSize.height / fromImageSize.width)
        var toViewBounds = view.bounds
        var toImageViewWidth = CGRectGetWidth(toViewBounds)
        var toImageViewHeight = toImageViewWidth * aspectRatio
        return CGRect(x: 0, y: CGRectGetMidY(toViewBounds) - toImageViewHeight * 0.5, width: toImageViewWidth, height: toImageViewHeight)
    }
    
    // Captures scrolling and updates view alpha values
    func scrollViewDidScroll(scrollView: UIScrollView) {
        var alpha = 1 - abs(scrollView.contentOffset.y) / scrollView.bounds.height
        photoFadeView.alpha = alpha
        doneButton.alpha = alpha
        footerActionBar.alpha = alpha
    }
    
    // Registers scrolling ended and optionally dismisses photo
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if abs(scrollView.contentOffset.y) >= 100 {
            finishDismissingPhoto()
        }
    }
    
    // Finishes dismissing photo
    func finishDismissingPhoto() {
        isDismissingPhoto = true
        dismissViewControllerAnimated(true, completion: { () -> Void in
            self.isDismissingPhoto = false
        })
    }
    
    // Sets status bar style to either light or dark (default)
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }

}
