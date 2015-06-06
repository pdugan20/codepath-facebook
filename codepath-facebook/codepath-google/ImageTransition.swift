//
//  ImageTransition.swift
//  codepath-google
//
//  Created by Patrick Dugan on 6/6/15.
//  Copyright (c) 2015 dailydoog. All rights reserved.
//

import UIKit

class ImageTransition: BaseTransition {
    override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        var tabBarController = fromViewController as! UITabBarController
        var tabBarChildViewControllers = tabBarController.viewControllers as! [UIViewController]
        var navigationController = tabBarChildViewControllers[0] as! UINavigationController
        var feedViewController = navigationController.topViewController as! FeedViewController
        var photoViewController = toViewController as! PhotoViewController

        toViewController.view.alpha = 0
        var destinationImageFrame = photoViewController.photoImageView.frame
        photoViewController.photoImageView.frame = feedViewController.selectedImageView.frame
        
        UIView.animateWithDuration(duration, animations: {
            toViewController.view.alpha = 1
            photoViewController.photoImageView.frame = destinationImageFrame
            }) { (finished: Bool) -> Void in
                self.finish()
        }
    }
    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        fromViewController.view.alpha = 1
        UIView.animateWithDuration(duration, animations: {
            fromViewController.view.alpha = 0
            }) { (finished: Bool) -> Void in
                self.finish()
        }
    }
}
